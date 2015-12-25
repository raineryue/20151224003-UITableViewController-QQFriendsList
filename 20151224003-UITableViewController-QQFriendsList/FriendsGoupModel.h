//
//  FriendsGoupModel.h
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/24.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsGoupModel : NSObject

/** 组名 */
@property (nonatomic, copy) NSString *name;
/** 在线人数 */
@property (nonatomic, assign) NSNumber *online;
/** 好友列表 */
@property (nonatomic, strong) NSArray *friends;
/** 好友组是否打开 */
@property (nonatomic, assign) BOOL isOpen;

/**
 *  根据字典初始化一个好友列表模型
 */
- (instancetype)initFriendsGoupWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据字典初始化一个好友列表模型
 */
+ (instancetype)friendsGoupWithDictionary:(NSDictionary *)dictionary;

/**
 *  获取一个好友列表模型列表
 */
- (NSArray *)friendsGoupArray;

/**
 *  获取一个好友列表模型列表
 */
+ (NSArray *)friendsGoupArray;

@end
