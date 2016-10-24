//
//  JKRBubbleDelegate.h
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKRBubbleDelegateAnimationDelegate <NSObject>

@required
- (void)bubblePresentAnimationCompleted;
- (void)bubbleDismissAnimationStart;

@end

@interface JKRBubbleDelegate : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<JKRBubbleDelegateAnimationDelegate> delegate;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *bubbleColor;
@property (nonatomic, strong) UIView *bubble;

@end
