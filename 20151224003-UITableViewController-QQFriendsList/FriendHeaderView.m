//
//  FriendHeaderView.m
//  20151224003-UITableViewController-QQFriendsList
//
//  Created by Rainer on 15/12/25.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "FriendHeaderView.h"
#import "FriendsGoupModel.h"

@interface FriendHeaderView ()

/** 头部按钮 */
@property (nonatomic, weak) UIButton *headButton;
/** 在线人数 */
@property (nonatomic, weak) UILabel *onlineLabel;

@end

@implementation FriendHeaderView

#pragma mark - 初始化头部视图
/**
 *  根据表视图初始化一个表格头部视图
 */
- (instancetype)initFriendHeaderViewWithTableView:(UITableView *)tableView {
    static NSString *friendHeaderViewIdentifier = @"friendHeaderViewIdentifier";
    
    FriendHeaderView *friendHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:friendHeaderViewIdentifier];
    
    if (nil == friendHeaderView) {
        friendHeaderView = [super initWithReuseIdentifier:friendHeaderViewIdentifier];
    }
    
    return friendHeaderView;
}

/**
 *  根据表视图初始化一个表格头部视图
 */
+ (instancetype)friendHeaderViewWithTableView:(UITableView *)tableView {
    return [[FriendHeaderView alloc] initFriendHeaderViewWithTableView:tableView];
}

#pragma mark - 控件懒加载
/**
 *  头部按钮
 */
- (UIButton *)headButton {
    if (nil == _headButton) {
        UIButton *headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [headButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        headButton.imageView.clipsToBounds = NO;
        headButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [headButton addTarget:self action:@selector(headButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _headButton = headButton;
        [self.contentView addSubview:_headButton];
    }
    
    return _headButton;
}

/**
 *  在线人数
 */
- (UILabel *)onlineLabel {
    if (nil == _onlineLabel) {
        UILabel *onlineLabel = [[UILabel alloc] init];
        
        onlineLabel.textAlignment = NSTextAlignmentRight;
        
        _onlineLabel = onlineLabel;
        [self.contentView addSubview:_onlineLabel];
    }
    
    return _onlineLabel;
}

#pragma mark - 重写属性方法
/**
 *  重写好友列表setter方法
 */
- (void)setFriendsGoup:(FriendsGoupModel *)friendsGoup {
    _friendsGoup = friendsGoup;
    
    [self.headButton setTitle:friendsGoup.name forState:UIControlStateNormal];

    self.onlineLabel.text = [NSString stringWithFormat:@"%@/%lu", friendsGoup.online, (unsigned long)friendsGoup.friends.count];
}

#pragma mark - 按钮事件监听方法
/**
 *  头部按钮点击事件
 */
- (void)headButtonClickAction:(UIButton *)button {
    self.friendsGoup.isOpen = !self.friendsGoup.isOpen;
    
    if (self.block) {
        self.block(self);
    }
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:kFridendHeaderViewNotification object:self];
}

- (void)changeOpen {
    [self didMoveToSuperview];
}

#pragma mark - 视图布局
/**
 *  子视图布局
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headButton.frame = self.bounds;
    
    CGFloat onlineLabelW = 100;
    CGFloat onlineLabelH = self.bounds.size.height;
    CGFloat onlineLabelX = self.bounds.size.width - onlineLabelW - 10;
    CGFloat onlineLabelY = 0;
    
    self.onlineLabel.frame = CGRectMake(onlineLabelX, onlineLabelY, onlineLabelW, onlineLabelH);
}

/**
 *  子视图移除父视图
 */
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    NSLog(@"%s", __func__);
    
    if (self.friendsGoup.isOpen) {
        self.headButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.headButton.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
