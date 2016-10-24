//
//  JKRBubblePresentationController.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRBubblePresentationController.h"

@implementation JKRBubblePresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    return self;
}

//弹出
- (void)presentationTransitionWillBegin
{
    //* 如果自定义了动画代理，这里必须手动去设置modal出来控制器的显示尺寸，并把它的view加到显示控制器的view上面 */
    //* 如果没有自定义动画代理（没有自定义modal动画），这里是不用手动写的 */
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    
    self.presentedView.backgroundColor = [UIColor clearColor];
}

//退出
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    //* 如果自定义了动画代理，这里必须手动去移除 */
    //* 如果没有自定义动画代理（没有自定义modal动画），这里是不用手动写的 */
    [self.presentedView removeFromSuperview];
}

- (void)dealloc {
    
}

@end
