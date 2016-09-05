//
//  PQListVideoCollectionViewCell.m
//  LiveAppDemo
//
//  Created by ios on 16/9/5.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PQListVideoCollectionViewCell.h"

@interface PQListVideoCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *roomName;
@property (weak, nonatomic) IBOutlet UILabel *peoples;
@property (weak, nonatomic) IBOutlet UIImageView *fengmian;
@property (weak, nonatomic) IBOutlet UILabel *isLive;

@end

@implementation PQListVideoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.isLive.layer.cornerRadius = 3;
    self.isLive.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    self.isLive.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 3;
    self.icon.layer.masksToBounds = YES;
}

@end
