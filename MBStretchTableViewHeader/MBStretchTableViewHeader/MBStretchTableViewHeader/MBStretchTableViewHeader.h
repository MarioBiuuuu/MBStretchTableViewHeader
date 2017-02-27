//
//  MBStretchTableViewHeader.h
//  MBStretchTableViewHeader
//
//  Created by ZhangXiaofei on 17/2/27.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MBStretchTableViewHeader : NSObject


- (instancetype)initWithTableView:(UITableView *)tableView headerView:(UIView *)headerView;

+ (instancetype)stretchHeaderWithTableView:(UITableView *)tableView headerView:(UIView *)headerView;


@end
