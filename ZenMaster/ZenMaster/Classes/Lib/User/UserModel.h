//
//  UserModel.h

//
//  Created by 莫业金 on 16/5/29.
//  Copyright © 2016年 莫业金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/**
 *  判断跳转控制器 1 是登录状态 
 */
@property (nonatomic,copy) NSString *Login;

/**
* 用户头像
*/
@property(nonatomic, copy) NSString * avatar;
/** 用户性别 */
@property(nonatomic, copy) NSString * gender;
/** 用户昵称 */
@property(nonatomic, copy) NSString * nickname;
/** uid*/
@property(nonatomic, copy) NSString * user_uuid;
/** 手机 */
@property(nonatomic, copy) NSString * mobile;
/**
 * 版本号
 **/
@property (nonatomic,copy) NSString *version;



@end
