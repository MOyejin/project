//
//  MONewFeatureViewController.m
//
//  Created by user on 16/3/6.
//  Copyright © 2016年 son. All rights reserved.
//

#import "MONewFeatureViewController.h"
#import "MONewFeatureViewCell.h"
#import "UIView+Frame.h"

@interface MONewFeatureViewController ()

//滚动的点
@property (nonatomic,weak) UIPageControl *control;


@end

@implementation MONewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init{
    
    UICollectionViewFlowLayout *layou = [[UICollectionViewFlowLayout alloc] init];
    //设置cell的尺寸
    layou.itemSize = [UIScreen mainScreen].bounds.size;
    //清空行距
    layou.minimumLineSpacing = 0;
    
    //设置滚动方向
    layou.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return  [super initWithCollectionViewLayout:layou];
}
/*
 * self.collectionView != self.view
   注意: self.collectionView 是 self.view子控件
 
 //使用UICollectionViewController
 //1,初始化的时候设置布局参数
 //2,必须collectionView
 //3,自定义cell
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    //注册cell,默认就会创建这个类型的cell
    [self.collectionView registerClass:[MONewFeatureViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //分页
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //添加pageController (添加滚动点)
    [self setUpPageControl];
}

//添加滚动点
- (void)setUpPageControl{
    
    //添加pageController,只需要设置位置,不需要管理尺寸
    UIPageControl *control = [[UIPageControl alloc] init];
    
    control.numberOfPages = 3;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    
    //设置center
    control.center = CGPointMake(self.view.width * 0.5, self.view.height - 5);
    _control = control;
    [self.view addSubview:control];
}

#pragma mark - UIScrollView代理方法

//只要一滚动就会调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //获取当前的偏移量,计算当前第几页
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    //设置页数
    _control.currentPage = page;
}

#pragma mark <UICollectionViewDataSource>

//放回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//返回第section组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //现在有4张图片.以后有多少张就是有多少个cell
    return 3;
}

//cell的展现
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     * dequeueReusableCellWithReuseIdentifier
    1,首先从缓存池里取cell
    2.看下当前是否有注册cell,如果注册了cell,就会创建cell
    3.注意: 没有注册 ,程序崩溃
     */
    MONewFeatureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //给cell传值
    //拼接图片 (从 0 开始 ,所以要加 1 )
    NSString *imageName = [NSString stringWithFormat:@"guide_0%ld",indexPath.row + 1];
    
//    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
//    if(screenH > 480) { //屏幕尺寸 5 , 6 , 6 plus
//        imageName = [NSString stringWithFormat:@"new_feature_%ld-568h",indexPath.row + 1];
//    }
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:3];
    
    return cell;
}


@end
