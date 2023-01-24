# MacOS

## General

1. #### Disable resource forks (.\_\* and .DS_Store) on network drives

   - Run the following and reboot your computer:

     ```bash
     defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
     ```

2. #### Set default file associations

   - Remove Xcode associations, which may take priority:

     ```bash
     lsregister=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/Current/Support/lsregister
     $lsregister -u /Applications/Xcode.app
     ```

   - Install [duti](https://github.com/moretension/duti) from Homebrew, download [defaults.duti](defaults.duti), then load them:

     ```bash
     duti defaults.duti
     ```

3. #### Force external monitors in RGB mode

     ##### Intel CPU (x86_64)

     - Run the following and re-plug your monitor:

       ```bash
       wget https://gist.github.com/joevt/32e5efffe3459958759fb702579b9529/raw/af57cd459d9c5ddc09c22a247eb19c8aa4ae11a1/EDIDUtil.sh
       . ./EDIDUtil.sh
       loadioreg
       listedids
       removechromasubsampling
       makeoverride
       installoverride
       ```

     ##### Apple CPU (arm64)

     - Download [rgb-patch.py](rgb-patch.py), run the following, and reboot your computer:

       ```bash
       sudo ./rgb-patch.py
       ```

4. #### Create secure Wi-Fi hotspot

    - ```bash
       sudo networksetup -createnetworkservice Loopback lo0
       sudo networksetup -setmanual Loopback 127.0.0.1 255.0.0.0
       sudo networksetup -createnetworkservice AdHoc lo0
       sudo networksetup -setmanual AdHoc 192.168.1.88 255.255.255.255
       ```
       
    - **System Preferences** > **General** > **Sharing** > **Internet Sharing**, choose **AdHoc**, tick **Wi-Fi**, click **Wi-Fi Options** and set name/password, enable **Internet Sharing**