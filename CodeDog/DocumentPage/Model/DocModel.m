//
//  DocModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/15.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DocModel.h"

@implementation DocModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"bannerarticle": @"DocBannerarticleModel",
             @"userarticle": @"DocUserarticleModel",
             @"user": @"DocUserModel"};
}
@end
@implementation DocUserarticleModel

@end


@implementation DocUserModel

@end


@implementation DocBannerarticleModel

@end


