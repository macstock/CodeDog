//
//  MisarticleModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MisarticleModel.h"

@implementation MisarticleModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"article": @"MisarticleArticleModel",
             @"hotarticle": @"MisarticleHotarticleModel",
             @"category": @"MisarticleCategoryModel"};
}
@end
@implementation MisarticleArticleModel

@end


@implementation MisarticleCategoryModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation MisarticleHotarticleModel

@end


