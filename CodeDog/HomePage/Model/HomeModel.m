//
//  HomeModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"banner": @"HomeBannerModel",
             @"category": @"HomeCategoryModel",
             @"article": @"HomeArticleModel",
             @"random": @"HomeRandomModel",
             @"hotarticle": @"HomeHotarticleModel",
             @"pcategory": @"HomePcategoryModel",
             @"misarticle": @"HomeMisarticleModel",
             @"headline": @"HomeHeadlineModel"};
}
@end
@implementation HomeRandomModel

@end


@implementation HomeCategoryModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation HomeArticleModel

@end


@implementation HomeBannerModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation HomeHotarticleModel

@end


@implementation HomePcategoryModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation HomeMisarticleModel

@end


@implementation HomeHeadlineModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


