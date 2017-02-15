//
//  BaseNetManager.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 get and post enum
 */
typedef enum : NSUInteger {
    NetworkRequestMethodPOST,
    NetworkRequestMethodGET,
} NetworkRequestMethodENUM;

@interface BaseNetManager : NSObject

+(id)requestWithRequestMethod:(NetworkRequestMethodENUM)requestMethod path:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
