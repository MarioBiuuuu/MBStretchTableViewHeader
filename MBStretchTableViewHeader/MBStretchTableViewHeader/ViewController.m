//
//  ViewController.m
//  MBStretchTableViewHeader
//
//  Created by ZhangXiaofei on 17/2/27.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import "ViewController.h"
#import "MBStretchTableViewHeader.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MBStretchTableViewHeader *stretchHeaderView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 180)];
    header.image = [UIImage imageNamed:@"1111"];
    header.contentMode = UIViewContentModeScaleAspectFill;
    header.backgroundColor = [UIColor redColor];
    header.layer.masksToBounds = YES;
    self.tableView.tableHeaderView = header;

    self.stretchHeaderView = [MBStretchTableViewHeader stretchHeaderWithTableView:self.tableView headerView:header];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @(indexPath.section), @(indexPath.row)];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
