//
//  FriendHeaderView.h
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/25.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendsGoupModel;

// 头部视图通知名称
#define kFridendHeaderViewNotification @"fridendHeaderViewNotification"

// 定义一个按钮点击返回block
typedef void(^FriendHeaderViewBlock)(id);

@interface FriendHeaderView : UITableViewHeaderFooterView

/** 好友信息列表 */
@property (nonatomic, strong) FriendsGoupModel *friendsGoup;
/** 好友列表block */
@property (nonatomic, copy) FriendHeaderViewBlock block;

/**
 *  根据表视图初始化一个表格头部视图
 */
- (instancetype)initFriendHeaderViewWithTableView:(UITableView *)tableView;

/**
 *  根据表视图初始化一个表格头部视图
 */
+ (instancetype)friendHeaderViewWithTableView:(UITableView *)tableView;

- (void)changeOpen;

@end
