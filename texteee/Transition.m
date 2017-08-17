//
//  Transition.m
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "Transition.h"

#define MAIN_Height [UIScreen mainScreen].bounds.size.height
#define MAIN_Width [UIScreen mainScreen].bounds.size.width

@implementation Transition


- (instancetype)initWithType:(NSInteger)num{
    self = [super init];
    if (self) {
        self.num = num;
    }
    return self;
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}



- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    if (_num == 0) {
        [self presentVc:transitionContext];
    }else{
        [self dismissVc:transitionContext];
    }
}


- (void)presentVc:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    
    UINavigationController *fromVic = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *fromVic  = nv.viewControllers.lastObject;
    UIViewController *toVc    = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *temp = [fromVic.view snapshotViewAfterScreenUpdates:NO];
    temp.frame = fromVic.view.frame;
    fromVic.view.hidden = YES;
    
    UIView *context = [transitionContext containerView];
    context.backgroundColor = [UIColor grayColor];
    [context addSubview:temp];
    [context addSubview:toVc.view];
    
    toVc.view.frame  = CGRectMake(0, MAIN_Height, MAIN_Width, 400);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.60f initialSpringVelocity:1.0f / 0.6f options:0 animations:^{
        
        toVc.view.transform = CGAffineTransformMakeTranslation(0, -400);
        temp.transform = CGAffineTransformMakeScale(0.85, 0.85);
        
    } completion:^(BOOL finished) {
        fromVic.view.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    

}


- (void)dismissVc:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIView *context = transitionContext.containerView;

    NSArray *arr = context.subviews;
    UIView *temp = arr.lastObject;
    UIView *toView = arr[arr.count-2];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        temp.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        BOOL bo = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!bo];
        
    }];
    
    
}


@end
