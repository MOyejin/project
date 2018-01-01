//
//  UserModel.m

//
//  Created by 莫业金 on 16/5/29.
//  Copyright © 2016年 莫业金. All rights reserved.
//

#import "UserModel.h"
@implementation UserModel
// 底层便利当前的类的所有属性，一个一个归档和解档
MJCodingImplementation

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    
    UserModel *account = [[UserModel alloc] init];
    account = [UserModel mj_objectWithKeyValues:dict];
    [account mj_setKeyValues:dict];

    return account;
    
}
@end
