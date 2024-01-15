//
//  SingleFlutterVC.m
//  Flutter
//
//  Created by deng on 2024/1/15.
//

#import "SingleFlutterVC.h"
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
@interface SingleFlutterVC ()
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) FlutterMethodChannel *channel;
@end
@implementation SingleFlutterVC
- (instancetype)initWithEntrypoint:(NSString *)entrypoint
{
    FlutterEngineGroup *groupEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).groupEngine;
    FlutterEngine *engine = [groupEngine makeEngineWithEntrypoint:entrypoint libraryURI:nil];
    [GeneratedPluginRegistrant registerWithRegistry:engine];
    self = [super initWithEngine:engine nibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.channel = [FlutterMethodChannel methodChannelWithName:@"my_flutter" binaryMessenger:self.engine.binaryMessenger];

//    接收flutter调用
    __weak __typeof(self) weakSelf = self;
    [self.channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        __strong __typeof(self) strongSelf = weakSelf;
        NSString *method = call.method;
        if([method isEqualToString:@"setCount"]){
            strongSelf.count = call.arguments;
            NSLog(@"weakSelf.count %@",weakSelf.count);
            result(nil);
        }else {
            result(FlutterMethodNotImplemented);
        }

    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //主动调用flutter
        NSInteger number = [self.count integerValue];
        self.count = [NSString stringWithFormat:@"%zd", number+1];
        [self.channel invokeMethod:@"setCount" arguments:self.count];
    });
}

@end
