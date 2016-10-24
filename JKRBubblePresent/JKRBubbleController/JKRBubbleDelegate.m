//
//  JKRBubbleDelegate.m
//  JKRBubblePresent
//
//  Created by tronsis_ios on 16/10/24.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "JKRBubbleDelegate.h"
#import "JKRBubblePresentationController.h"

@implementation JKRBubbleDelegate {
    BOOL _isPresent;
}

- (instancetype)init {
    self = [super init];
    _duration = 0.5;
    _bubbleColor = [UIColor redColor];
    _bubble = [UIView new];
    _bubble.backgroundColor = _bubbleColor;
    return self;
}

- (void)setBubbleColor:(UIColor *)bubbleColor {
    _bubbleColor = bubbleColor;
    _bubble.backgroundColor = _bubbleColor;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    JKRBubblePresentationController *presentationController = [[JKRBubblePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _isPresent = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _isPresent = NO;
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    if (_isPresent) {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        
        self.bubble.frame = [self frameForBubble:originalCenter originalSize:originalSize start:self.startPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = self.startPoint;
        self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.bubble.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.bubble];
        
        presentedControllerView.center = self.startPoint;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];

        [UIView animateWithDuration:self.duration animations:^{
            self.bubble.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [self.delegate bubblePresentAnimationCompleted];
        }];

    } else {
        UIView *returningControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;
        
        self.bubble.frame = [self frameForBubble:originalCenter originalSize:originalSize start:self.startPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = self.startPoint;
        
        [self.delegate bubbleDismissAnimationStart];
        [UIView animateWithDuration:self.duration animations:^{
            self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.startPoint;
            returningControllerView.alpha = 0;
        } completion:^(BOOL finished) {
            returningControllerView.center = originalCenter;
            [returningControllerView removeFromSuperview];
            [self.bubble removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

- (CGRect)frameForBubble:(CGPoint)originalCenter originalSize:(CGSize)originalSize start:(CGPoint)start
{
    CGFloat lengthX = fmax(start.x, originalSize.width - start.x);
    CGFloat lengthY = fmax(start.y, originalSize.height - start.y);
    CGFloat offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
    CGSize size = CGSizeMake(offset, offset);
    
    return CGRectMake(CGPointZero.x, CGPointZero.y, size.width, size.height);
}

- (void)dealloc {
    
}

@end
