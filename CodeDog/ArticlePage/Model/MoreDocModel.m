//
//  MoreDocModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MoreDocModel.h"

@implementation MoreDocModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": @"MoreDocDataModel"};
}
@end
@implementation MoreDocDataModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


