//
//  HeardView.m
//  texteee
//
//  Created by 张子豪 on 2017/8/15.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "HeardView.h"

@implementation HeardView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor redColor];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width-70 , 70)];
    view.backgroundColor =[ UIColor whiteColor];
    view.alpha = 0.2;
    [self addSubview:view];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.frame = view.bounds;
    layer.path = path.CGPath;
    view.layer.mask = layer;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).with.offset(20);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-70 , 70));
    }];
    
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    lbl.text = @"每日签到加一分，上限三分，中断则重新计算";
    lbl.textColor = [UIColor redColor];
    lbl.font = [UIFont systemFontOfSize:12];
    [self addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(10);
        make.centerX.equalTo(self);
    }];
    
    
    UIStackView *containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    containerView.axis = UILayoutConstraintAxisHorizontal;
    containerView.distribution = UIStackViewDistributionFillEqually;
    containerView.alignment = UIStackViewAlignmentFill;
    
//    CGRect rect = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
//    CGFloat View_width = rect.size.width;
//    CGFloat View_height = rect.size.height;
//    UIBezierPath *path_ = [UIBezierPath bezierPath];
//    CGPoint star = CGPointMake(0, View_height);
//    CGPoint end  = CGPointMake(View_width, View_height);
//    [path_ moveToPoint:star];
//    [path_ addLineToPoint:end];
//    CAShapeLayer *layer_ = [CAShapeLayer layer];
//    layer_.path = path.CGPath;
//    layer_.lineWidth = 1;
//    layer_.strokeColor = [UIColor whiteColor].CGColor;
//    [containerView.layer addSublayer:layer_];

    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).with.offset(20);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-70 , 70));
    }];
    
    for (NSInteger i = 0; i < 5; i++) {
        UIView *vi = [[UIView alloc]init];
        UILabel *l1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width/5, 30)];
        l1.text = @"123";
        l1.textAlignment=1;
        [vi addSubview:l1];
        UILabel *l2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, view.frame.size.width/5, 40)];
        l2.textAlignment =1;
        l2.text = @"123";
//        l2.backgroundColor = [UIColor whiteColor];
        [vi addSubview:l2];
        [containerView addArrangedSubview:vi];
    }
    
}





@end
