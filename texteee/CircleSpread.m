//
//  CircleSpread.m
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "CircleSpread.h"

@implementation CircleSpread


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
    
    UINavigationController *fromVc = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *fromVc  = nv.viewControllers.lastObject;
    UIViewController *toVc   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *context = [transitionContext containerView];
//    
    UIView *temp = [fromVc.view snapshotViewAfterScreenUpdates:NO];
    temp.frame = fromVc.view.frame;
    [context addSubview:temp];
    [context addSubview:toVc.view];
    
//    x平方+y平方 = 半径
    CGFloat radius = sqrtf(pow([UIScreen mainScreen].bounds.size.width/2, 2) + pow([UIScreen mainScreen].bounds.size.height/2, 2));
    
    UIBezierPath *star_path= [UIBezierPath bezierPathWithArcCenter:toVc.view.center radius:5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *end_path = [UIBezierPath bezierPathWithArcCenter:toVc.view.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *mask_layer = [CAShapeLayer layer];
    mask_layer.path = end_path.CGPath;
    mask_layer.fillColor = [UIColor yellowColor].CGColor;
    toVc.view.layer.mask = mask_layer;
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"path"];
    basic.delegate  = self;
    basic.fromValue = (__bridge id _Nullable)((star_path.CGPath));
    basic.toValue   = (__bridge id _Nullable)((end_path.CGPath));
    basic.duration  = [self transitionDuration:transitionContext];
    [basic setValue:transitionContext forKey:@"transitionContext"];
    [mask_layer addAnimation:basic forKey:@"path"];
    
    
}

- (void)dismissVc:(id<UIViewControllerContextTransitioning>)transitionContext{

    UIView *fromVc = transitionContext.containerView.subviews.lastObject;
    //    x平方+y平方 = 半径
    CGFloat radius = sqrtf(pow([UIScreen mainScreen].bounds.size.width/2, 2) + pow([UIScreen mainScreen].bounds.size.height/2, 2));
    
    UIBezierPath *end_path= [UIBezierPath bezierPathWithArcCenter:fromVc.center radius:5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *star_path = [UIBezierPath bezierPathWithArcCenter:fromVc.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *mask_layer = [CAShapeLayer layer];
    mask_layer.path = star_path.CGPath;
    fromVc.layer.mask = mask_layer;
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"path"];
    basic.delegate  = self;
    basic.fromValue = (__bridge id _Nullable)((star_path.CGPath));
    basic.toValue   = (__bridge id _Nullable)((end_path.CGPath));
    basic.duration  = [self transitionDuration:transitionContext];
    [basic setValue:transitionContext forKey:@"transitionContext"];
    [mask_layer addAnimation:basic forKey:@"path"];
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    switch (_num) {
        case 0:{
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:YES];
            //            [transitionContext viewControllerForKey:UITransitionContextToViewKey].view.layer.mask = nil;
        }
            break;
        case 1:{
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if ([transitionContext transitionWasCancelled]) {
                [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
            }
        }
            break;
    }
}




@end
