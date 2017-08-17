//
//  ViewController.m
//  texteee
//
//  Created by 张子豪 on 2017/8/14.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "ViewController.h"
#import "HeardView.h"
#define BOUND_WIDTH     [UIScreen mainScreen].bounds.size.width
#define BOUND_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, BOUND_WIDTH, BOUND_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate      = self;
    tableView.dataSource    = self;
    tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tableView];
    
    HeardView *vi = [[HeardView alloc]initWithFrame: CGRectMake(0, 0, BOUND_WIDTH, 250)];
    vi.backgroundColor = [UIColor orangeColor];
    tableView.tableHeaderView = vi;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70;
    }else if(indexPath.row == 1){
        return 40;
    }
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idef = @"123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idef];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idef];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor redColor ];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
