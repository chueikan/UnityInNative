//
//  AppDelegate.m
//  UnityInNative
//
//  Created by 韩中睿 on 2020/6/19.
//  Copyright © 2020 韩中睿. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UnityAppController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(UIWindow *)unityWindow{
    return  UnityGetMainWindow();
}

-(void)showUnityWindow{
    //进入unity界面
    UnityPause(false);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.unityWindow makeKeyAndVisible];
    });
}

-(void)hideUnityWindow{
    
    //退出Unity界面
    UnityPause(true);
    [self.window makeKeyAndVisible];
}

-(void)StartMyUnity {
    [_unityController applicationDidBecomeActive:[UIApplication sharedApplication]];
    [self showUnityWindow];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.unityController = [[UnityAppController alloc] init];
    [_unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;

    [self.window makeKeyWindow];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [_unityController applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [_unityController applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [_unityController applicationWillEnterForeground:application];
}

static BOOL isFirst = NO;

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [_unityController applicationDidBecomeActive:application];
    if (!isFirst) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hideUnityWindow];
            isFirst = YES;
        });
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [UIApplication sharedApplication].idleTimerDisabled = NO;

    [_unityController applicationWillTerminate:application];
}


@end
