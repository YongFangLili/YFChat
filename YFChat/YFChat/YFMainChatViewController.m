//
//  YFMainChatViewController.m
//  YFChat
//
//  Created by 李永方 on 15/12/23.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "YFMainChatViewController.h"
#import "UserInfoManager.h"
#import "YFChatRoomController.h"

@interface YFMainChatViewController ()<UITableViewDelegate>

@property (nonatomic,strong)NSArray *friends;


@end

@implementation YFMainChatViewController

-(NSDictionary *)userInfo {
    
    if (_userInfo == nil) {
        
        _userInfo = [NSDictionary dictionary];
    }

    return _userInfo;

}

-(NSArray *)friends {

    if (_friends == nil) {
        
        _friends = [NSArray array];
    }
    return _friends;

}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    //获取用户信息
    
   self.title = [UserInfoManager sharedUserInfoManager].UserInfo[@"username"];
   self.friends = [UserInfoManager sharedUserInfoManager].friendsList;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"freindsList"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"freindsList" forIndexPath:indexPath];
    EMBuddy *budy = self.friends[indexPath.row];
    
    cell.textLabel.text = budy.username;
    
    return cell;
}

//选中行进入到聊天界面
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //获取对应好友的信息
    EMBuddy *budy = self.friends[indexPath.row];
    NSLog(@"%@",budy);
    //进入聊天界面进行聊天
    YFChatRoomController *chatVC = [[YFChatRoomController alloc] init];
    chatVC.title = [NSString stringWithFormat:@"正在和%@聊天", budy.username];
    
    [self.navigationController pushViewController:chatVC animated:YES];


}


@end
