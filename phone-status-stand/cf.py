import re
import subprocess

def getADBDevices():
    # xx \t device \r
    # xx \t device \r
    # \w\t\w\t
    result = []
    pattern = re.compile('\w+\t\w+\r')

    regMatch = pattern.findall(subprocess.run(
        ["adb", "devices"], stdout=subprocess.PIPE).stdout.decode('UTF-8'))

    for each in regMatch:
        result.append(each.split())
    for each in result:
        if each[1] == "device":
            each[1] = True
        else:
            each[1] = False
    return result


def getOSVersion(deviceSerial):
    # rstrip used to remove whitechar (newline) from the end of string
    return subprocess.run(["adb", "-s", deviceSerial, "shell", "getprop", "ro.build.version.release"], stdout=subprocess.PIPE).stdout.decode('UTF-8').rstrip()

def getAppVersions( deviceSerial, packageName):
    pattern = re.compile("[0-9]+\.[0-9]+\.[0-9]+\-[0-9]+") # TODO made regex to match diffrent lengt of app version with diffrent characters

    regMatch = pattern.findall(subprocess.run(["adb", "-s", deviceSerial, "shell", "dumpsys", "package" ,packageName], stdout=subprocess.PIPE).stdout.decode('UTF-8'))

    if len(regMatch) == 0:
        return False
    elif len(regMatch) < 2:
        return regMatch[0]
    return regMatch
