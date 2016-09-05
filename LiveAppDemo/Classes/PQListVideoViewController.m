//
//  PQListVideoViewController.m
//  LiveAppDemo
//
//  Created by ios on 16/9/5.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PQListVideoViewController.h"
#import <AFNetworking.h>
#import <MJProperty.h>
@interface PQListVideoViewController ()

@property (nonatomic,weak) UICollectionView * collectionView;

@end

@implementation PQListVideoViewController

static NSString * const identifier = @"collection";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewLayout * layout = [[UICollectionViewLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [collectionView registerNib:[UINib nibWithNibName:@"PQListVideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    self.collectionView = collectionView;
    [self.view addSubview:self.collectionView];
    
    [self loadData];
    
}

- (void)loadData
{
    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        [NSObject m]
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
