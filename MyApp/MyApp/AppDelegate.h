//
//  AppDelegate.h
//  MyApp
//
//  Created by 高延波 on 2020/12/14.
//  Copyright © 2020 高延波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,FlutterAppLifeCycleProvider>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) FlutterEngine *flutterEngine;
@end

