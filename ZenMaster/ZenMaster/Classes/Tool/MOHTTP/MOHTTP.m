//
//  MOHTTP.m
//  E农会
//
//  Created by 莫业金 on 16/5/29.
//  Copyright © 2016年 莫业金. All rights reserved.
//

#import "MOHTTP.h"
#import "AFNetworking.h"

#define API_Release_Url @""

@implementation MOHTTP
+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
//    // 创建请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    //拼接URL
//    NSString *URLStr = [NSString stringWithFormat:@"%@%@",PostUrl,URLString];
//    NSLog(@"%@+++",URLStr);
//    NSLog(@"%@---",parameters);
//    [mgr GET:URLStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        if (success) {
//            NSString *str_status = [NSString stringWithFormat:@"%@",[responseObject valueForKey:@"statusCode"]];
//            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
//            [dic setObject:str_status forKey:@"statusCode"];
//            success(dic);
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
    
    
}

+ (void)Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
//    // 创建请求管理者
    //拼接URL
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",API_Release_Url,URLString];
    NSLog(@"%@+++",URLStr);
    NSLog(@"%@---",parameters);
    
    NSString *url = [NSString stringWithFormat:@"%@%@",API_Release_Url,URLString];
    
    [[AFHTTPSessionManager manager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
     
        if (success) {
            
            NSLog(@"%@", responseObject);
            success(responseObject);
   
        }


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络错误"];
    }];




}
@end
