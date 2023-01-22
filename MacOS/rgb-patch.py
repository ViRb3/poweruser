#!/usr/bin/env python3
import plistlib, os

if os.geteuid() != 0:
    print("Please run as sudo.")
    exit(1)

print("Reading...")
with open("/Library/Preferences/com.apple.windowserver.displays.plist", "rb") as f:
    data = plistlib.load(f)

for config in data["DisplayAnyUserSets"]["Configs"]:
    for display_config in config["DisplayConfig"]:
        if display_config["UUID"] == "37D8832A-2D66-02CA-B9F7-8F30A301B230":
            print("Skipping built-in display")
            continue
        print(f"Patching display {display_config['UUID']}")
        display_config["LinkDescription"] = {
            "Range": 1,
            "BitDepth": 8,
            "EOTF": 0,
            "PixelEncoding": 0,
        }

print("Writing...")
with open("/Library/Preferences/com.apple.windowserver.displays.plist", "wb") as f:
    plistlib.dump(data, f)

print("Done!")
