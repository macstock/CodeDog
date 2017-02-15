//
//  ArticleModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": @"ArticleDataModel",
             @"hot": @"ArticleHotModel"};
}
@end
@implementation ArticleHotModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end

@implementation ArticleDataModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


