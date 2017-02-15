//
//  NSObject+Parse.m
//  CodeDog
//
//  Created by zerocpp on 16/12/8.
//  Copyright © 2016年 zerocpp. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
+ (id)parse:(id)JSON{
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:JSON];
    }
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:self.class json:JSON];
    }
    return JSON;
}
@end
