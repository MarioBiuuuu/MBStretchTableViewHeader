//
//  MBStretchTableViewHeader.m
//  MBStretchTableViewHeader
//
//  Created by ZhangXiaofei on 17/2/27.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import "MBStretchTableViewHeader.h"

@interface MBStretchTableViewHeader() {
    CGRect _stretchHeaderInitialFrame;
    CGFloat _stretchHeaderInitialHeight;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@end


@implementation MBStretchTableViewHeader
+ (instancetype)stretchHeaderWithTableView:(UITableView *)tableView headerView:(UIView *)headerView {
    return [[self alloc] initWithTableView:tableView headerView:headerView];
}

- (instancetype)initWithTableView:(UITableView *)tableView headerView:(UIView *)headerView {
    if (self = [super init]) {
        self.tableView = tableView;
        self.headerView = headerView;
        
        _stretchHeaderInitialFrame = self.headerView.frame;
        _stretchHeaderInitialHeight = _stretchHeaderInitialFrame.size.height;
        
        UIView *emptyTableHeaderView = [[UIView alloc] initWithFrame:_stretchHeaderInitialFrame];
        self.tableView.tableHeaderView = emptyTableHeaderView;
        
        [self.tableView addSubview:self.headerView];
        
        [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context: nil];
    }
    return self;
}


/**
 *  监听属性值发生改变时回调
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    CGRect f = self.headerView.frame;
    f.size.width = self.tableView.frame.size.width;
    self.headerView.frame = f;
    
    if(self.tableView.contentOffset.y < 0) {
        CGFloat offsetY = (self.tableView.contentOffset.y + self.tableView.contentInset.top) * (-1);
        _stretchHeaderInitialFrame.origin.y = offsetY * (-1);
        _stretchHeaderInitialFrame.size.height = _stretchHeaderInitialHeight + offsetY;
        self.headerView.frame = _stretchHeaderInitialFrame;
    }
}


@end
