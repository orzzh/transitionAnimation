//
//  Transition.h
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Transition : NSObject<UIViewControllerAnimatedTransitioning>

@property (assign)NSInteger num;

- (instancetype)initWithType:(NSInteger)num;
@end
