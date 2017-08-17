//
//  AViewController.m
//  texteee
//
//  Created by 张子豪 on 2017/8/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "TransitionManager.h"
@interface AViewController ()<UIViewControllerTransitioningDelegate>
{
    TRANSITIONTYPE type;
}
@end

@implementation AViewController



- (void)dealloc{
    NSLog(@"vc1 xxx");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)pop:(id)sender {
    
    type = TypeOne;
    [self presentVC];
    
}
- (IBAction)typetwo:(id)sender {
    
    type = TYpeTwo;
    [self presentVC];
}

- (void)presentVC{
    
    BViewController *vb = [[BViewController alloc]init];
    vb.transitioningDelegate = self;
    vb.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vb animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    NSLog(@"123");
    return [TransitionManager SearchType:type PrsentOrDismiss:0];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    NSLog(@"dismiss");
    return [TransitionManager SearchType:type PrsentOrDismiss:1];
}

@end
