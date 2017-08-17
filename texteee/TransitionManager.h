//
//  TransitionManager.h
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CircleSpread.h"
#import "Transition.h"
typedef NS_ENUM(NSInteger, TRANSITIONTYPE) {
    
    TypeOne = 0,
    TYpeTwo,
};

@interface TransitionManager : NSObject


+ (id<UIViewControllerAnimatedTransitioning>)SearchType:(TRANSITIONTYPE)type PrsentOrDismiss:(NSInteger)num;


@end
