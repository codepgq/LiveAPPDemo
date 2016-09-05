//
//  ViewController.m
//  LiveAppDemo
//
//  Created by ios on 16/9/5.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ViewController.h"
#import "PQTBDelegate.h"
#import "PQTBDataSource.h"
#import "PQListVideoViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic,strong) PQTBDelegate * delegateTB;
@property (nonatomic,strong) PQTBDataSource * dataSourceTB;


@end

@implementation ViewController{
    
}

static NSString * const Identifier = @"PQIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * data = @[@"直播列表"];
    
    self.delegateTB = [PQTBDelegate delegateWith:data identifier:Identifier cellSelectedBlock:^(UITableViewCell * cell, id  _Nullable item) {
        if ([item isEqualToString:@"直播列表"] == YES) {
            //join 直播列表
            PQListVideoViewController * list = [[PQListVideoViewController alloc]init];
            [self.navigationController pushViewController:list animated:YES];
        }
    }];
    
    self.myTableView.delegate = self.delegateTB;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    
    self.dataSourceTB = [PQTBDataSource dataSourceWith:data identifier:Identifier cellConfigBlock:^(UITableViewCell * cell, id  _Nullable item) {
        cell.textLabel.text = item;
    }];
    self.myTableView.dataSource = self.dataSourceTB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
