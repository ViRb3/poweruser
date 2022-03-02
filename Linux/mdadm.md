# mdadm

## Rename array

```bash
mdadm --assemble /dev/md0 --uuid "86f421fa:6920146e:85e363c3:d37873bc" --name="new-name" --update=name
```

## Create RAID-1 array from existing data

### Definitions

- `/dev/sda` - existing data
- `/dev/sdf` - new, empty drive

### Commands

```bash
# wipe any existing partition data just in case
wipefs -a /dev/sdf1
wipefs -a /dev/sdf
# create new partition table + partition
# the new partition has to be smaller than the smallest drive in the array,
# minus 0.1% to cover different branded disks having varying usable space
fdisk /dev/sdf
# create a degraded array with the freshly formatted partition
mdadm --create /dev/md0 --level=mirror --raid-devices=2 /dev/sdf1 missing
# encrypt the array
cryptsetup luksFormat -c xchacha20,aes-adiantum-plain64 --pbkdf-memory 512000 /dev/md0
# mount the encrypted partition
cryptsetup open /dev/md0 crypted
# format the encrypted partition
mkfs.ext4 /dev/mapper/crypted
# mount both drives
mount /dev/mapper/crypted /mnt/crypted
mount -o ro /dev/sda1 /mnt/existing
# copy all existing data to the array
# mind the trailing slash!
rsync -av --progress /mnt/existing/ /mnt/crypted
# unmount the existing data drive
umount /mnt/existing
# wipe any existing partition data just in case
wipefs -a /dev/sda1
wipefs -a /dev/sda
# create new partition table + partition
# the new partition has to be exactly the same size as the one you made before
fdisk /dev/sda
# add the new partition to the array
mdadm --add /dev/md0 /dev/sda1
# monitor the sync progress
mdadm --detail /dev/md0
cat /proc/mdstat
```

## Resources

- https://arstechnica.com/civis/viewtopic.php?p=21332270
