//
//  FriendModel.m
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/24.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

/**
 *  根据字典初始化一个好友信息模型
 */
- (instancetype)initFriendWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  根据字典初始化一个好友信息模型
 */
+ (instancetype)friendWithDictionary:(NSDictionary *)dictionary {
    return [[FriendModel alloc] initFriendWithDictionary:dictionary];
}

/**
 *  根据数组获取一个好友模型数组
 */
- (NSArray *)friendArrayWithArray:(NSArray *)array {
    NSMutableArray *friendArray = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        FriendModel *friendModel = [self initFriendWithDictionary:obj];
        
        [friendArray addObject:friendModel];
    }];
    
    return friendArray;
}

/**
 *  根据数组获取一个好友模型数组
 */
+ (NSArray *)friendArrayWithArray:(NSArray *)array {
    return [[[FriendModel alloc] init] friendArrayWithArray:array];
}

/**
 *  复写description方法
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>{icon:%@, intro:%@, name:%@, vip:%d}", self.class, self, self.icon, self.intro, self.name, self.vip];
}

@end
