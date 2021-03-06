//
//  PQTBDelegate.m
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PQTBDelegate.h"
#import "UIView+pgqViewExtension.h"
typedef void(^CellSelectedBlock)(id _Nullable cell, id _Nullable item);

@interface PQTBDelegate ()
//传入之后不允许用户在外面随意更改数据
@property (nonatomic,strong,readwrite) NSMutableArray * _Nullable valuesArray;
@property (nonatomic,copy) CellSelectedBlock cellSelectedBlock;
@property (nonatomic,copy)  NSString *identifier;
@end

@implementation PQTBDelegate

+ (nonnull instancetype)delegateWith:(nullable NSArray *)values identifier:(nullable NSString *)identifier cellSelectedBlock:(nullable void(^)( id _Nullable cell,id _Nullable item))block{
    return [[self alloc]initWithdelegate:values identifier:identifier cellSelectedBlock:block];
}
- (nonnull instancetype)initWithdelegate:(nullable NSArray *)values identifier:(nullable NSString *)identifier cellSelectedBlock:(nullable void(^)(id _Nullable cell,id _Nullable item))block
{
    self = [super init];
    if (self) {
        self.valuesArray = [NSMutableArray arrayWithArray:values];
        self.cellSelectedBlock = [block copy];
        self.identifier = identifier;
        self.headerH = 30;
    }
    return self;
}

- (id _Nullable )itemWithIndexPath:(NSIndexPath *)indexPath{
    return self.valuesArray[indexPath.row];
}
//
//
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 60, 30)];
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 50, 30)];
//    label.contentMode = UIViewContentModeCenter;
//    label.text = self.valuesArray[section];
//    [view addSubview:label];
//    if (section == 0) {
//        UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
//        searchBar.searchBarStyle = UISearchBarStyleProminent;
//        [view addSubview:searchBar];
//        view.height +=30;
//        label.y += 35;
//    }
//    view.backgroundColor = [UIColor whiteColor];
//    return view;
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return self.headerH + 40;
//    }
//    return self.headerH;
//}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id cell = [tableView cellForRowAtIndexPath:indexPath];
    id item = [self itemWithIndexPath:indexPath];
    self.cellSelectedBlock(cell,item);
}





@end
