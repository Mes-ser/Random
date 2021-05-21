
class PhoneDetails():
    countDevices = 0
    def __init__( self, deviceSerial: str, deviceAuth: bool ):
        self.deviceSerial = deviceSerial
        self.deviceAuth = deviceAuth
        self.deviceFWVersion = None
        self.deviceUptime = None
        self.STAppVersion = None
        self.STAppVersionStock = None
        self.STCAppVersion = None
        PhoneDetails.countDevices += 1

    # def __del__(self):
    #     PhoneDetails.countDevices -= 1
