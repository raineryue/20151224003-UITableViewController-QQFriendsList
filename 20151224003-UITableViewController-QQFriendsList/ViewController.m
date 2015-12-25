//
//  ViewController.m
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/24.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "FriendsGoupModel.h"
#import "FriendModel.h"
#import "FriendHeaderView.h"

@interface ViewController ()

/** 好友列表数组 */
@property (nonatomic, strong) NSArray *friendsGoupArray;

@end

@implementation ViewController

#pragma mark - 视图加载方法
/**
 *  视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置当前tableView的内边距
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(friendHeadViewNotifictionAction:) name:kFridendHeaderViewNotification object:nil];
}

#pragma mark - tableView数据源方法
/**
 *  返回TableView的总组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendsGoupArray.count;
}

/**
 *  返回每组的总列数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendsGoupModel *friendGoup = self.friendsGoupArray[section];
    
    return friendGoup.isOpen ? friendGoup.friends.count : 0;
}

/**
 *  返回TableView的单元格
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"friendTableViewCellIdentifier";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableViewCellIdentifier];
    }
    
    FriendsGoupModel *friendGoup = self.friendsGoupArray[indexPath.section];
    
    FriendModel *friendModel = friendGoup.friends[indexPath.row];
    
    tableViewCell.imageView.image = [UIImage imageNamed:friendModel.icon];
    tableViewCell.textLabel.text = friendModel.name;
    tableViewCell.detailTextLabel.text = friendModel.intro;
    
    if (friendModel.isVip) {
        tableViewCell.textLabel.textColor = [UIColor redColor];
    }
    
    return tableViewCell;
}

/**
 *  返回一个当前组的头部视图
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    __block FriendHeaderView *friendHeaderView = [FriendHeaderView friendHeaderViewWithTableView:tableView];
    
    friendHeaderView.friendsGoup = self.friendsGoupArray[section];
    
    // 改变头标方向
    [friendHeaderView changeOpen];
    
    // 点击头部按钮返回事件处理
    friendHeaderView.block = ^(id sender) {
        [self.tableView reloadData];
    };
    
    return friendHeaderView;
}

/**
 *  返回当前组头部视图的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

//- (void)friendHeadViewNotifictionAction:(NSNotification *)notification {
//    [self.tableView reloadData];
//}

#pragma mark - 属性懒加载
/**
 *  返回当前好友列表数组
 */
- (NSArray *)friendsGoupArray {
    if (nil == _friendsGoupArray) {
        _friendsGoupArray = [FriendsGoupModel friendsGoupArray];
    }
    
    return _friendsGoupArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
