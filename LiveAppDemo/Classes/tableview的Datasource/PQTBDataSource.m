//
//  PQTBDataSource.m
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQTBDataSource.h"
typedef void(^CellConfigBlock)(id _Nullable cell, id _Nullable item);
@interface PQTBDataSource ()
//传入之后不允许用户在外面随意更改数据
@property (nonatomic,strong,readwrite) NSMutableArray * _Nullable valuesArray;
@property (nonatomic,copy) NSString * identifier;
@property (nonatomic,copy) CellConfigBlock cellConfigBlock;
@end

@implementation PQTBDataSource


+ (nonnull instancetype)dataSourceWith:(nullable NSArray *)values identifier:(nullable NSString *)identifier  cellConfigBlock:(nullable void(^)( id _Nullable cell,id _Nullable item))block{
    return [[self alloc]initWithDataSource:values identifier:identifier cellConfigBlock:block];
}
- (nonnull instancetype)initWithDataSource:(nullable NSArray *)values identifier:(nullable NSString *)identifier  cellConfigBlock:(nullable void(^)(id _Nullable cell,id _Nullable item))block
{
    self = [super init];
    if (self) {
        self.identifier = identifier ;
        self.valuesArray = [NSMutableArray arrayWithArray:values];
        self.cellConfigBlock = [block copy];
    }
    return self;
}

//提供方法更新，删除,获取
- (void)pq_insertValueWithItem:(NSInteger)item value:(id _Nullable)value{
    if ([self canEditArray:item]) {
       [self.valuesArray insertObject:value atIndex:item];
    }
}
- (void)pq_deleteValueWithItem:(NSInteger)item{
    if ([self canEditArray:item]) {
        [self.valuesArray removeObjectAtIndex:item];
    }
}
- (id _Nullable)pq_valueWithItem:(NSInteger)item{
    if ([self canEditArray:item]) {
        return self.valuesArray[item];
    }
    return nil;
}

- (BOOL)canEditArray:(NSInteger)item{
    if (item < self.valuesArray.count && item >= 0) {
        return YES;
    }
    return NO;
}

- (void)pq_updateWithArray:(NSArray *)array{
    self.valuesArray = nil;
    self.valuesArray = [NSMutableArray arrayWithArray:array];
}

- (id _Nullable )itemWithIndexPath:(NSIndexPath *)indexPath{
    return self.valuesArray[indexPath.row];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.valuesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id item = [self itemWithIndexPath:indexPath];
    self.cellConfigBlock(cell,item);
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.valuesArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    //需要返回一个数组
    //用valueForKey只能在本层级字典中查找，而self.carsArray是数组，且没有title关键字
    //用valueForKeyPath可以在本级及下级字典数组中查找，有path路径
    NSMutableArray * array = [NSMutableArray array];
    [self.valuesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[obj description]];
    }];
    return array;
}

//点击右侧索引表项时调用
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSString *key = [self.valuesArray objectAtIndex:index];
    if (key == UITableViewIndexSearch) {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    return index;
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
