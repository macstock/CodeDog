//
//  BaseNetManager.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager

+(id)requestWithRequestMethod:(NetworkRequestMethodENUM)requestMethod path:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    if (requestMethod == NetworkRequestMethodGET) {
        return [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", task.currentRequest.URL.absoluteString);
            !completionHandler ?: completionHandler(responseObject, nil);
            //缓存路径
            NSString *cachePath = @"/Library/Caches/MyCache";
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            !completionHandler ?: completionHandler(nil, error);
        }];
        
    }else{
        return [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", task.currentRequest.URL.absoluteString);
            !completionHandler ?: completionHandler(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            !completionHandler ?: completionHandler(nil, error);
        }];
    }
    
    
}

@end
