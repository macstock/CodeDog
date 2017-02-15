//
//  NSString+SX.h
//  CodeDog
//
//  Created by zerocpp on 16/12/8.
//  Copyright © 2016年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SX)
-(NSURL *)sx_URL;
- (NSURL *)sx_IconURL;
- (NSInteger)fileSize;
@end
