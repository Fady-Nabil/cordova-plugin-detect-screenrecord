/********* detect-screenrecord.h Cordova Plugin Header *******/

#import <Cordova/CDV.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *kScreenRecordingDetectorRecordingStatusChangedNotification;

@interface detectscreenrecord : CDVPlugin

- (void)detectscreenrecord:(CDVInvokedUrlCommand*)command;

@end

@interface ScreenRecordingDetector : NSObject

+(instancetype)sharedInstance;
+ (void)triggerDetectorTimer;
+ (void)stopDetectorTimer;
- (BOOL)isRecording;

@end