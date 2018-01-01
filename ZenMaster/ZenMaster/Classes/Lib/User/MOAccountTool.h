//
//  MOAccountTool.h

//
//  Created by 莫业金 on 16/5/30.
//  Copyright © 2016年 莫业金. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
@interface MOAccountTool : NSObject

/**
 *  存数据
 *
 */
+ (void)saveAccount:(UserModel *)account;

/**
 *  读取数据
 *
 */
+ (UserModel *)account;

/**
 *  清除所有归档的内容
 */
+(void)deleteAccount;

@end
