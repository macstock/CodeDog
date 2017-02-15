//
//  DownloadModel.m
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DownloadModel.h"

@implementation DownloadModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": @"DownlaodDataModel"};
}
@end
@implementation DownloadRecordModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation DownlaodDataModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


