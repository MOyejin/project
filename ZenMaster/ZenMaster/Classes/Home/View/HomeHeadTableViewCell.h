//
//  HomeHeadTableViewCell.h
//  ZenMaster
//
//  Created by 莫业金 on 2017/12/30.
//  Copyright © 2017年 momo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeadTableViewCell : UITableViewCell

@property (nonatomic,copy) void (^HomeHeadTableViewCellBlcok)(NSInteger num);

@end
