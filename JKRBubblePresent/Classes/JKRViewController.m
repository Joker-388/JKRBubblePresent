//
//  JKRViewController.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRViewController.h"
#import "UITextField+JKRAdd.h"
#import "UIButton+JKRAdd.h"

@interface JKRViewController ()

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation JKRViewController

- (instancetype)init {
    self = [super init];
    _accountTextField = [UITextField jkr_textFieldWithPlaceHolder:@"请输入用户名"];
    _passwordTextField = [UITextField jkr_textFieldWithPlaceHolder:@"请输入密码"];
    _loginButton = [UIButton jkr_button];
    [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_accountTextField];
    [self.view addSubview:_passwordTextField];
    [self.view addSubview:_loginButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _accountTextField.frame = CGRectMake(30, self.view.frame.size.height * 0.3, self.view.frame.size.width - 60, 30);
    _passwordTextField.frame = CGRectMake(30, CGRectGetMaxY(_accountTextField.frame) + 20, _accountTextField.frame.size.width, _accountTextField.frame.size.height);
    _loginButton.frame = CGRectMake(30, CGRectGetMaxY(_passwordTextField.frame) + 20, _accountTextField.frame.size.width, 30);
}

- (void)loginButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
