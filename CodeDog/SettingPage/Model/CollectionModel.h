//
//  CollectionModel.h
//  CodeDog
//
//  Created by zerocpp on 17/2/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ColletionDataModel;
@interface CollectionModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<ColletionDataModel *> *data;

@end
@interface ColletionDataModel : NSObject

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *aid;

@end

