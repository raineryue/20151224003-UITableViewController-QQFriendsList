//
//  FriendModel.h
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/24.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 描述 */
@property (nonatomic, copy) NSString *intro;
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 会员 */
@property (nonatomic, assign, getter=isVip) BOOL vip;

/**
 *  根据字典初始化一个好友信息模型
 */
- (instancetype)initFriendWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据字典初始化一个好友信息模型
 */
+ (instancetype)friendWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据数组获取一个好友模型数组
 */
- (NSArray *)friendArrayWithArray:(NSArray *)array;

/**
 *  根据数组获取一个好友模型数组
 */
+ (NSArray *)friendArrayWithArray:(NSArray *)array;

@end
