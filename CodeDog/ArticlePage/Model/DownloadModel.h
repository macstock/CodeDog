//
//  DownloadModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DownloadRecordModel,DownlaodDataModel;
@interface DownloadModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<DownlaodDataModel *> *data;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *count;

@property (nonatomic, strong) DownloadRecordModel *record;

@end
@interface DownloadRecordModel : NSObject

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *isdown;
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *filepath;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *filename;

@property (nonatomic, copy) NSString *totalsize;

@property (nonatomic, copy) NSString *cid;

@end

@interface DownlaodDataModel : NSObject

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *isdown;
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *filepath;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *filename;

@property (nonatomic, copy) NSString *totalsize;

@property (nonatomic, copy) NSString *cid;

@end

