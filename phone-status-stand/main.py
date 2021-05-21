from phonedetails import PhoneDetails
from cf import *

connectedDevicesObjects = []

for device in getADBDevices():
    # device - list with two elements | 1st device Serial(uniqe ID) | 2nd boolean value if device is auth
    connectedDevicesObjects.append(PhoneDetails(*device))


for device in connectedDevicesObjects:
    if not device.deviceAuth:
        print(f"{device.deviceSerial} isn't authorized!")
    else:
        device.deviceFWVersion = getOSVersion(device.deviceSerial)
        print(f"Device: {device.deviceSerial}, Auth: {device.deviceAuth}, FW: {device.deviceFWVersion}")
        # getAppVersions return False when theres no version available | string when only one is matched | list of string when more then one found
        appVersions = getAppVersions(device.deviceSerial, "com.xx.xx.xx")
        if appVersions:
            if type(appVersions) is list:
                device.STAppVersion, device.STAppVersionStock = (*appVersions,)
            else:
                device.STAppVersion = appVersions

            print(f"Current Version: {device.STAppVersion} | Stock version: {device.STAppVersionStock}")
        else:
            print("Cannot find app version.")
