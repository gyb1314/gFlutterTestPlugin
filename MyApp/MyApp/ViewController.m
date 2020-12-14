//
//  ViewController.m
//  MyApp
//
//  Created by 高延波 on 2020/12/14.
//  Copyright © 2020 高延波. All rights reserved.
//

#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Make a button to call the showFlutter function when pressed.
   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   [button addTarget:self
              action:@selector(showFlutter)
    forControlEvents:UIControlEventTouchUpInside];
   [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
   button.backgroundColor = UIColor.blueColor;
   button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
   [self.view addSubview:button];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    //单项通信管道，Flutter向原生发送消息
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:@"flutter_and_native_101" binaryMessenger:flutterViewController];
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"test" isEqualToString:call.method]) {
            NSLog(@"收到来自flutter的消息 test");
            [weakSelf dismissViewControllerAnimated:true completion:nil];
        }
    }];
    [self presentViewController:flutterViewController animated:YES completion:nil];
}

@end
