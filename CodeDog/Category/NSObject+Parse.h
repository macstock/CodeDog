//
//  NSObject+Parse.h
//  CodeDog
//
//  Created by zerocpp on 16/12/8.
//  Copyright © 2016年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel>

+ (id)parse:(id)JSON;

@end
