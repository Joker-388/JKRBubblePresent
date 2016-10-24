//
//  UITextField+JKRAdd.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "UITextField+JKRAdd.h"

@implementation UITextField (JKRAdd)

+ (instancetype)jkr_textFieldWithPlaceHolder:(NSString *)placeHolder {
    UITextField *textField = [UITextField new];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:placeHolder];
    [attr setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : [UIFont systemFontOfSize:13]} range:NSMakeRange(0, attr.length)];
    textField.attributedPlaceholder = attr;
    textField.tintColor = [UIColor greenColor];
    textField.font = [UIFont systemFontOfSize:13];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    return textField;
}

@end
