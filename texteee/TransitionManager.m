//
//  TransitionManager.m
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "TransitionManager.h"

@implementation TransitionManager


+ (id<UIViewControllerAnimatedTransitioning>)SearchType:(TRANSITIONTYPE)type PrsentOrDismiss:(NSInteger)num{
    if (type == TypeOne) {
        
        return [[Transition alloc]initWithType:num];
    }else{
        
        return [[CircleSpread alloc]initWithType:num];
    }
}

@end
