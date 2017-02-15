//
//  NSString+SX.m
//  CodeDog
//
//  Created by zerocpp on 16/12/8.
//  Copyright © 2016年 zerocpp. All rights reserved.
//

#import "NSString+SX.h"

@implementation NSString (SX)
-(NSURL *)sx_URL{
    return [NSURL URLWithString:self];
}
- (NSURL *)sx_IconURL{
    return [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", self].sx_URL;
}
- (NSInteger)fileSize
{
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    // 是否为文件夹
    BOOL isDirectory = NO;
    // 这个路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    // 路径不存在
    if (exists == NO) return 0;
    
    if (isDirectory) { // 文件夹
        // 总大小
        NSInteger size = 0;
        // 获得文件夹中的所有内容
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 获得全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 获得文件属性
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
        return size;
    } else { // 文件
        return [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
}

@end
