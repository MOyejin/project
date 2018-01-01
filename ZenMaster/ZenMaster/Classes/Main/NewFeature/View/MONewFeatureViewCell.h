//
//  MONewFeatureViewCell.h
//
//  Created by user on 16/3/6.
//  Copyright © 2016年 son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MONewFeatureViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImage *image;

//判断是否是最后一页
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
