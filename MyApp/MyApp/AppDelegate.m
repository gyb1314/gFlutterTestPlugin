//
//  AppDelegate.m
//  MyApp
//
//  Created by 高延波 on 2020/12/14.
//  Copyright © 2020 高延波. All rights reserved.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface AppDelegate (){
    FlutterMethodChannel* methodChannel;
    FlutterBasicMessageChannel* messageChannel;
    FlutterEventSink     eventSink;
}
@property (nonatomic, strong) FlutterPluginAppLifeCycleDelegate* lifeCycleDelegate;
@end

@implementation AppDelegate

- (instancetype)init {
    if (self = [super init]) {
        _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
    }
    return self;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    // Runs the default Dart entrypoint with a default Flutter route.
    [self.flutterEngine run];
    // Used to connect plugins (only if you have plugins with iOS platform code).
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];;
}

// Returns the key window's rootViewController, if it's a FlutterViewController.
// Otherwise, returns nil.
//- (FlutterViewController*)rootFlutterViewController {
//    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
//    if ([viewController isKindOfClass:[FlutterViewController class]]) {
//        return (FlutterViewController*)viewController;
//    }
//    return nil;
//}


//-(UIWindow*)keyWindow
//{
//    UIWindow *foundWindow = nil;
//    NSArray  *windows = [[UIApplication sharedApplication]windows];
//    for (UIWindow  *window in windows) {
//        if (window.isKeyWindow) {
//            foundWindow = window;
//            break;
//        }
//    }
//    return foundWindow;
//}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


- (void)addApplicationLifeCycleDelegate:(nonnull NSObject<FlutterApplicationLifeCycleDelegate> *)delegate {
    [_lifeCycleDelegate addDelegate:delegate];
}

@end
