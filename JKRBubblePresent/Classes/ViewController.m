//
//  ViewController.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "ViewController.h"
#import "JKRViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    JKRViewController *controller = [JKRViewController new];
    controller.startPoint = point;
    controller.bubbleColor = [UIColor whiteColor];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
