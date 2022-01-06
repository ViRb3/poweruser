# MacOS

## General

1. #### Disable resource forks (.\_\* and .DS_Store) on network drives

   - Run the following and reboot your computer:

     ```
     defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
     ```
