//
//  MOHomeViewController.m
//  ZenMaster
//
//  Created by mo on 2017/12/26.
//  Copyright © 2017年 momo. All rights reserved.
//

#import "MOHomeViewController.h"
#import <WRNavigationBar.h>
#import <SDAutoLayout.h>
#import <SDCycleScrollView.h>
#import "UIImage+Image.h"

#import "HomeHeadTableViewCell.h"

#import "MOTheYardViewController.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 220
#define NAV_HEIGHT 64

@interface MOHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic, strong)UITableView *table_main;

@property (nonatomic, assign)CGFloat alpha;

@property (nonatomic, assign)NSInteger judgment;

@property (nonatomic,strong) UIImageView *linView;

@end

@implementation MOHomeViewController

- (UIImageView *)linView{
    if (!_linView) {
        _linView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    }
    return _linView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.linView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.linView.hidden = NO;

}
//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wr_setNavBarBarTintColor:[UIColor colorWithRed:12/255.0 green:144/255.0 blue:168/255.0 alpha:1.0]];

    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];

    [self wr_setNavBarBackgroundAlpha:self.alpha];

    [self setSDCycle];
}


- (void)setSDCycle{
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, MOScreenW, IMAGE_HEIGHT) delegate:self placeholderImage:[UIImage imageNamed:@"轮播图1"]];
    cycleScrollView.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514548921517&di=fa67b738775bb600282e5647bcd9a902&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c10385343235433e19a13b07ecb808853.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514548921517&di=e87fb2b6bd99d9d8bf72360529cd27c3&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F6c224f4a20a446230cacbda39122720e0df3d788.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514548921516&di=270fc95bb815a4518a29bfd0bc90dd41&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F0eb30f2442a7d933536294b3a44bd11372f00123.jpg"];
//    self.scrollView = cycleScrollView;
    cycleScrollView.backgroundColor = [UIColor clearColor];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.pageControlDotSize = CGSizeMake(18, 18.f);
    cycleScrollView.currentPageDotColor = [UIColor greenColor];
    cycleScrollView.pageDotColor = [UIColor whiteColor];
    self.table_main.tableHeaderView = cycleScrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self wr_setNavBarBackgroundAlpha:alpha];
        [self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
        self.alpha = alpha;
    }
    else
    {
        [self wr_setNavBarBackgroundAlpha:0];
        [self wr_setNavBarTintColor:[UIColor whiteColor]];
        [self wr_setNavBarTitleColor:[UIColor whiteColor]];
        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];

        self.alpha = 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = @"HomeHeadTableViewCell";
    HomeHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[HomeHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
        __weak typeof(self) weakSelf = self;
    cell.HomeHeadTableViewCellBlcok = ^(NSInteger num) {
        
        [weakSelf.navigationController pushViewController:[[MOTheYardViewController alloc] init] animated:YES];
        NSLog(@"%ld",num);
    };
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [self cellHeightForIndexPath:indexPath cellContentViewWidth:MOScreenW tableView:self.table_main];
    NSLog(@"%f",height);
     return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MOTheYardViewController *the = [[MOTheYardViewController alloc] init];
    [self.navigationController pushViewController:the animated:YES];
    the.title = @"测试";
    the.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (UITableView *)table_main
{
    if (_table_main == nil) {
        CGRect frame = CGRectMake(0, 0, MOScreenW, MOScreenH);
        _table_main = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _table_main.contentInset = UIEdgeInsetsMake(-[self navBarBottom], 0, 0, 0);
        _table_main.delegate = self;
        _table_main.dataSource = self;
        [self.view addSubview:_table_main];
    }
    return _table_main;
}

- (int)navBarBottom
{
    if ([WRNavigationBar isIphoneX]) {
        return 88;
    } else {
        return 64;
    }
}

@end
