//
//  FriendsGoupModel.m
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/24.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "FriendsGoupModel.h"
#import "FriendModel.h"

@implementation FriendsGoupModel

/**
 *  根据字典初始化一个好友列表模型
 */
- (instancetype)initFriendsGoupWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  根据字典初始化一个好友列表模型
 */
+ (instancetype)friendsGoupWithDictionary:(NSDictionary *)dictionary {
    return [[FriendsGoupModel alloc] initFriendsGoupWithDictionary:dictionary];
}

/**
 *  获取一个好友列表模型列表
 */
- (NSArray *)friendsGoupArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"]];
    
    NSMutableArray *friendsArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [friendsArray addObject:[FriendsGoupModel friendsGoupWithDictionary:obj]];
    }];
    
    NSMutableArray *friendsGoupArray = [NSMutableArray array];
    
    [friendsArray enumerateObjectsUsingBlock:^(FriendsGoupModel *friendsGoupModel, NSUInteger idx, BOOL *stop) {
        NSArray *friendArray = [FriendModel friendArrayWithArray:friendsGoupModel.friends];
        
        friendsGoupModel.friends = friendArray;
        
        [friendsGoupArray addObject:friendsGoupModel];
    }];
    
    return friendsGoupArray;
}

/**
 *  获取一个好友列表模型列表
 */
+ (NSArray *)friendsGoupArray {
    return [[[FriendsGoupModel alloc] init] friendsGoupArray];
}

/**
 *  复写description方法
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>{name:%@, online:%@, friends:%@}", self.class, self, self.name, self.online, self.friends];
}

@end
