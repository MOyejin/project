//
//  MONewFeatureViewCell.m

//
//  Created by user on 16/3/6.
//  Copyright © 2016年 son. All rights reserved.
//

#import "MONewFeatureViewCell.h"
#import "MONavigationController.h"
#import "MOTabBarController.h"

@interface MONewFeatureViewCell()

@property (nonatomic,weak) UIImageView *imageView;

//开始
@property (nonatomic,weak) UIButton *starButton;


@end

@implementation MONewFeatureViewCell

//开始
- (UIButton *)starButton{
    if(!_starButton) {
        
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [startBtn setTitle:@"马上开启" forState:UIControlStateNormal];
        [startBtn setTitleColor: [UIColor colorWithRed:88 / 250.0 green:166 / 250.0 blue:245 / 250.0 alpha:1] forState:UIControlStateNormal];

        [startBtn.layer setMasksToBounds:YES];
        [startBtn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
        //边框宽度
        [startBtn.layer setBorderWidth:1.0];
        
      startBtn.layer.borderColor=[UIColor colorWithRed:88 / 250.0 green:166 / 250.0 blue:245 / 250.0 alpha:1].CGColor;
        
        //监听点击事件
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        //设置图片
        
        
  
        //设置frame
        
        [self addSubview:startBtn];
        _starButton = startBtn;
        
    }
    return _starButton;
}

//点击  开始微博  按钮
- (void)start{
    
    //进入tabbarVc
  
    MOTabBarController *tab = [[MOTabBarController alloc] init];

    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    
}

- (UIImageView *)imageView{
    if(!_imageView) {
        UIImageView *imageV = [[UIImageView alloc] init];
        _imageView = imageV;
        
        //注意:一定要加载contentView
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}

//布局子控件的frame
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
 
    self.starButton.frame = CGRectMake((MOScreenW - 100) *0.5, MOScreenH * 0.9 - 64, 100, 40);
    
}

//重写属性的set方法给iamge赋值
- (void)setImage:(UIImage *)image{
    _image = image;
    
    self.imageView.image = image;
}

//判断当前cell是否是最后一页
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count{
    
    if(indexPath.row == count - 1) {
        
        //最后一页,显示和开始按钮

        self.starButton.hidden = NO;
    }else{
        //不是最后一页
        self.starButton.hidden  = YES;
    }
}


@end
