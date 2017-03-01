//
//  SXFactory.m
//  CodeDog
//
//  Created by zerocpp on 17/1/8.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "SXFactory.h"

@implementation SXFactory

+(NSMutableAttributedString *)addAttributedString:(NSInteger)viewNum PvColor:(pvColorENUM)pvColor{
    if (viewNum < 10000) {
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %ld", viewNum]];
        NSTextAttachment *strAtt = [NSTextAttachment new];
        if (pvColor == pvColorWhite) {
            strAtt.image = [UIImage imageNamed:@"pv~iphone"];
        }else if(pvColor == pvColorGray){
            strAtt.image = [UIImage imageNamed:@"pv_gray~iphone"];
        }else if(pvColor == pvColorBlack){
            strAtt.image = [UIImage imageNamed:@"topic_scan~iphone"];
        }else{
            strAtt.image = [UIImage imageNamed:@"comment_up~iphone"];
        }
        NSAttributedString *str2 = [NSAttributedString attributedStringWithAttachment:strAtt];
        NSMutableAttributedString *mutStr = [NSMutableAttributedString new];
        [mutStr appendAttributedString:str2];
        [mutStr appendAttributedString:str];
        return mutStr;
    }else{
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %.1f万", viewNum / 10000.0]];
        NSTextAttachment *strAtt = [NSTextAttachment new];
        if (pvColor == pvColorWhite) {
            strAtt.image = [UIImage imageNamed:@"pv~iphone"];
        }else{
            strAtt.image = [UIImage imageNamed:@"pv_gray~iphone"];
        }
        NSAttributedString *str2 = [NSAttributedString attributedStringWithAttachment:strAtt];
        NSMutableAttributedString *mutStr = [NSMutableAttributedString new];
        [mutStr appendAttributedString:str2];
        [mutStr appendAttributedString:str];
        return mutStr;
    }
}

+(void)addBackItemToVC:(UIViewController *)vc{
    //如果barButtonItem上方有两个图 高亮+普通  那就只能定义一个按钮，加到barButtonItem上
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(25, 0, 23, 16);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    //修复距离
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = -10;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.leftBarButtonItems = @[fixedItem, item];
}

//时间戳转换为时间
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString{
    NSTimeInterval time = [timeString doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
    double distanceTime = now - time;
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    if(distanceTime < 60) {//小于一分钟
        return @"刚刚";
    }else if (distanceTime < 60 * 60) {//时间小于一个小时
        return [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime / 60];
    }else if (distanceTime < 24 * 60 * 60 && distanceTime > 60 * 60) {
        //时间大于一个小时 小于一天
        return [NSString stringWithFormat:@"%ld小时前",(long)distanceTime / (60 * 60)];
    }else if (distanceTime > 24 * 60 * 60 && distanceTime < 48 * 60 * 60){
        return @"昨天";
    }else{
        return currentDateStr;
    }
}
    
+(void)addShareItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"share~iphone"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 40, 8);
//    __weak typeof(self) weakSelf = self;
    [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    //修复距离
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 10;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    vc.navigationItem.rightBarButtonItems = @[item, fixedItem];
}

-(void)share{
    __weak typeof(self) weakSelf = self;
    //显示分享面板
    [UMSocialUIManager  showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        //真正的调用分享
        [weakSelf shareTextToPlatformType:platformType];
    }];
}
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}
@end
