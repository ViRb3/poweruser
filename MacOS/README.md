# MacOS

## General

1. #### Disable resource forks (.\_\* and .DS_Store) on network drives

   - Run the following and reboot your computer:

     ```
     defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
     ```

2. #### Set default file associations

   - Install [duti](https://github.com/moretension/duti) from Homebrew, download [defaults.duti](defaults.duti), then load them:

     ```
       duti defaults.duti
     ```
