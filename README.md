# MBStretchTableViewHeader
Create a tableview header which can be stretched.    
一句代码创建一个可以被拉伸的表头, 支持通过XIB创建的视图
**Usage:**
* 在使用的位置引用头文件 `#import "MBStretchTableViewHeader.h"`
* 构造方法: `self.stretchHeaderView = [[MBStretchTableViewHeader alloc] initWithTableView:self.tableView headerView:header holderViews:nil];`
* 通过`[[MBStretchTableViewHeader alloc] init];`初始化,使用`[self.stretchHeaderView configureWithTableView:self.tableView headerView:header holderViews:@[bottomView, leftView]];`
* 设置`holderViews`, 传入一个包含HeaderView子视图的数组, 设置当前可随着移动的视图, 如果设置为`nil` 或 `空数组`, 默认全部HeaderView的子视图.
* `headerSubViewMoving`属性默认为`YES`, 如果不需要子控件随之移动, 可以设置为`NO`
***注意: 无需手动设置当前UITableView的表头***

