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

4. #### Spoof WiFi MAC address

    - `/usr/local/sbin/spoof.sh`
      ```bash
      #!/bin/bash
      
      mac_address="f0:2f:4b:12:34:56"
      
      wifi_status=$(networksetup -getairportpower en0)
      networksetup -setairportpower en0 on
      sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --disassociate
      sudo ifconfig en0 ether "$mac_address"
      networksetup -setairportpower en0 off
      
      if echo "$wifi_status" | grep -q "On"; then
          networksetup -setairportpower en0 on
      fi
      ```

    - `/Library/LaunchDaemons/local.spoof.plist`
      ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>local.spoof</string>
          <key>ProgramArguments</key>
          <array>
              <string>/usr/local/sbin/spoof.sh</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
        </dict>
      </plist>
      
      ```