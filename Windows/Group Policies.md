# Group Policies

Using the [LGPO](https://www.microsoft.com/en-us/download/details.aspx?id=55319) tool _(mirror [here](https://github.com/ViRb3/windows-vm-ansible/blob/master/res/policies/LGPO.exe))_, import any of the following policies:
- [Privacy](https://github.com/ViRb3/windows-vm-ansible/blob/master/res/policies/privacy.txt)
- [Disable Defender](https://github.com/ViRb3/windows-vm-ansible/blob/master/res/policies/defender.txt)

Example:

```powershell
.\LGPO.exe /t privacy.txt
```
