//
//  ViewController.m
//  UnityInNative
//
//  Created by 韩中睿 on 2020/6/19.
//  Copyright © 2020 韩中睿. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 600, 100, 50)];
    [btn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    btn.tag = 1;
    [self.view addSubview:btn];
    
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(250, 600, 100, 50)];
    [btn2 addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 2;
    [btn2 setTitle:@"结束" forState:UIControlStateNormal];
    [self.view addSubview:btn2];

}

- (void)test:(UIButton *) btn{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.unityWindow.frame = CGRectMake(0, 0, 300, 580);
    
    if (btn.tag == 1) {
        [self.view addSubview:delegate.unityWindow];
        delegate.unityWindow.hidden = NO;
        [delegate StartMyUnity];
    }else {
        [delegate hideUnityWindow];
        delegate.unityWindow.hidden = YES;
    }
    
}

@end
