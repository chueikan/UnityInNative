//
//  AppDelegate.h
//  UnityInNative
//
//  Created by 韩中睿 on 2020/6/19.
//  Copyright © 2020 韩中睿. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UnityAppController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIWindow *unityWindow;

@property (strong, nonatomic) UnityAppController *unityController;

-(void)StartMyUnity; //开启unity
- (void)hideUnityWindow; //退出Unity 其实是暂停

@end

