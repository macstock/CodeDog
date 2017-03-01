//
//  UIView+HUD.m
//  TRProject
//
//  Created by zerocpp on 16/11/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
-(void)showMsg:(NSString *)msg{
    [MBProgressHUD hideHUDForView:self animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.labelText = msg;
    [hud hide:YES afterDelay:3];
}


-(void)showBusy{
    [MBProgressHUD hideHUDForView:self animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:30];
}

-(void)hideBusy{
    [MBProgressHUD hideHUDForView:self animated:YES];
}
@end
