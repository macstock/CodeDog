//
//  SXFactory.h
//  CodeDog
//
//  Created by zerocpp on 17/1/8.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    pvColorWhite,
    pvColorGray,
    pvColorBlack,
    commentUp
} pvColorENUM;

@interface SXFactory : NSObject
+(NSMutableAttributedString *)addAttributedString:(NSInteger)viewNum PvColor:(pvColorENUM)pvColor;
//添加返回按钮
+(void)addBackItemToVC:(UIViewController *)vc;//返回按钮
    
//时间戳转换为时间
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString;

//分享按钮
+(void)addShareItemToVC:(UIViewController *)vc;
@end
