//
//  UIButton+JKRAdd.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "UIButton+JKRAdd.h"

@implementation UIButton (JKRAdd)

+ (instancetype)jkr_button {
    UIButton *button = [UIButton new];
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.layer.cornerRadius = 15;
    button.layer.masksToBounds = YES;
    return button;
}

@end
