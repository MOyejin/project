//
//  MOAccountTool.m
//  E农会
//
//  Created by 莫业金 on 16/5/30.
//  Copyright © 2016年 莫业金. All rights reserved.
//

#import "MOAccountTool.h"
#import "UserModel.h"

#define accountFlieName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation MOAccountTool
// 类方法一般用静态变量代替成员属性
static UserModel *account = nil;
+ (void)saveAccount:(UserModel *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:accountFlieName];
}

+ (UserModel *)account
{
    if (account == nil) {
        account = [NSKeyedUnarchiver unarchiveObjectWithFile:accountFlieName];
    }
    return account;
}
+(void)deleteAccount{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:accountFlieName];
    if (blHave) {
        //删除缓存信息
        account = nil;
        //删除归档信息
        [fileManager removeItemAtPath:accountFlieName error:nil];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
//        [defaults removeObjectForKey:@"bindedCity"];
        
        [defaults synchronize];
        
    }
}




@end
