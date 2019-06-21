#import "GetIosDeviceIdfaPlugin.h"
@import AdSupport;

@implementation GetIosDeviceIdfaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel =
    [FlutterMethodChannel methodChannelWithName:@"get_ios_device_idfa"
                                binaryMessenger:[registrar messenger]];
    GetIosDeviceIdfaPlugin* instance = [[GetIosDeviceIdfaPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID *identifier = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        result([identifier UUIDString]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
