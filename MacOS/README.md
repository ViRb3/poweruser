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
