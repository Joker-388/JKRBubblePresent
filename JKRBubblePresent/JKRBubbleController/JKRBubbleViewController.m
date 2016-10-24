//
//  JKRBubbleViewController.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRBubbleViewController.h"
#import "JKRBubbleDelegate.h"

@interface JKRBubbleViewController ()<JKRBubbleDelegateAnimationDelegate>

@end

@implementation JKRBubbleViewController {
    JKRBubbleDelegate *_bubbleDelegate;
}

- (instancetype)init {
    self = [super init];
    _bubbleDelegate = [JKRBubbleDelegate new];
    _bubbleDelegate.delegate = self;
    self.transitioningDelegate = _bubbleDelegate;
    self.modalPresentationStyle = UIModalPresentationCustom;
    return self;
}

- (void)setBubbleColor:(UIColor *)bubbleColor {
    _bubbleDelegate.bubbleColor = bubbleColor;
}

- (void)setStartPoint:(CGPoint)startPoint {
    _bubbleDelegate.startPoint = startPoint;
}

- (void)setBubbleDuration:(CGFloat)bubbleDuration {
    _bubbleDelegate.duration = bubbleDuration;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 0.0;
    }];
}

- (void)bubblePresentAnimationCompleted {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 1.0;
    }];
}

- (void)bubbleDismissAnimationStart {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 0.0;
    }];
}

- (void)dealloc {
    
}

@end
