//
//  UIView+HUD.h
//  TRProject
//
//  Created by zerocpp on 16/11/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
- (void)showMsg:(NSString *)msg;

- (void)showBusy;
- (void)hideBusy;
@end
