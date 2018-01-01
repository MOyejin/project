//
//  HomeHeadTableViewCell.m
//  ZenMaster
//
//  Created by 莫业金 on 2017/12/30.
//  Copyright © 2017年 momo. All rights reserved.
//

#import "HomeHeadTableViewCell.h"

@interface HomeHeadTableViewCell()
{
    UIScrollView *_scrollView;
    
    UIView *_flowItemContentView;
    
    NSArray *_array;
}


@end

@implementation HomeHeadTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _array = [NSArray arrayWithObjects:
                  @[@{@"image":@"bq"},@{@"title":@"健康祈祷"}],
                  @[@{@"image":@"bq"},@{@"title":@"交通安全"}],
                  @[@{@"image":@"bq"},@{@"title":@"生意兴隆"}],
                  @[@{@"image":@"bq"},@{@"title":@"消灾解难"}],
                  @[@{@"image":@"bq"},@{@"title":@"助孕求子"}],
                  @[@{@"image":@"bq"},@{@"title":@"学业考试"}],
                  @[@{@"image":@"bq"},@{@"title":@"宅安人旺"}],
                  @[@{@"image":@"bq"},@{@"title":@"超度逝者"}], nil];
        
      
        
        [self setupScrollView];
    }
    return self;
}

// 添加scrollview
- (void)setupScrollView
{
    UIScrollView *scroll = [UIScrollView new];
    [self.contentView addSubview:scroll];
    _scrollView = scroll;
    _scrollView.userInteractionEnabled = NO;
    
    // 设置scrollview与父view的边距
    scroll.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupFlowItemContentView];
    
    // 设置scrollview的contentsize自适应
    [scroll setupAutoContentSizeWithBottomView:_flowItemContentView bottomMargin:0];
    
    //设置cell自适应步骤1
    [self setupAutoHeightWithBottomView:_flowItemContentView bottomMargin:0];
    
//    UIButton *button = [UIButton new];
//
//    [self.contentView addSubview:button];
//    button.sd_layout.centerXEqualToView(_flowItemContentView)
//    .bottomSpaceToView(self.contentView, -5)
//    .widthIs(30)
//    .heightIs(25);
//    [button setTitle:@"点击" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:13];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
}

//- (void)button{
//    
//    if (self.HomeHeadTableViewCellBlcok) {
//        self.HomeHeadTableViewCellBlcok(1008);
//    }
//    
//}

// 添加flowItemContentView
- (void)setupFlowItemContentView
{
    _flowItemContentView = [UIView new];
    [_scrollView addSubview:_flowItemContentView];
    
    _flowItemContentView.sd_layout
    .leftEqualToView(_scrollView)
    .rightEqualToView(_scrollView)
    .topEqualToView(_scrollView)
    ;
    
    [self setupFlowItemViews];
}
- (void)setupFlowItemViews
{
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < _array.count; i++) {
        UIView *view = [UIView new];
        [temp addObject:view];
        [_flowItemContentView addSubview:view];
        view.sd_layout.heightIs(80);
        
        
        UIImageView *image = [UIImageView new];
        image.image = [UIImage imageNamed:_array[i][0][@"image"]];
        [view addSubview:image];
        image.sd_layout.topSpaceToView(view, 10)
        .widthIs(30)
        .autoHeightRatio(1)
        .centerXEqualToView(view);
        
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%@",_array[i][1][@"title"]];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        
        label.sd_layout.topSpaceToView(image, 5)
        .autoHeightRatio(0)
        .centerXEqualToView(view);
        
        [label setSingleLineAutoResizeWithMaxWidth:100];
        NSLog(@"%@----%@",view,label);
        
        UIButton *button = [UIButton new];
        button.tag = i;
        [view addSubview:button];
        [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        button.sd_layout.topEqualToView(view)
        .leftEqualToView(view)
        .rightEqualToView(view)
        .bottomEqualToView(view);
    }
    
    // 关键步骤：设置类似collectionView的展示效果
    [_flowItemContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:4 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    
    
}

- (void)selectButton:(UIButton *)button{
    
    if (self.HomeHeadTableViewCellBlcok) {
        self.HomeHeadTableViewCellBlcok(button.tag);
    }
    
}

@end
