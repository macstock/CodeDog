//
//  DocDetailModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DocDetailModel.h"

@implementation DocDetailModel

@end
@implementation DocDetailDiscussModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"praises": @"DocDetailPraisesModel",
             @"comments": @"DocDetailCommentsModel"};
}
@end


@implementation DocDetailPraisesModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation DocDetailCommentsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


