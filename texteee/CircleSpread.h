//
//  CircleSpread.h
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CircleSpread : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

- (instancetype)initWithType:(NSInteger)num;

@property (assign)NSInteger num;

@end
