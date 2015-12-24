//
//  UserInfoManager.m
//  YFChat
//
//  Created by 李永方 on 15/12/23.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "UserInfoManager.h"

@implementation UserInfoManager
+(instancetype)sharedUserInfoManager {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[UserInfoManager alloc]init];
    });
    
    return instance;
}

#warning 需要改善，当添加好友的时候，不能及时刷新
-(NSArray *)friendsList {
    
    if (_friendsList == nil) {
        
        //        [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
        
        [[EaseMob sharedInstance].chatManager asyncFetchBuddyListWithCompletion:^(NSArray *buddyList, EMError *error) {
            if (!error) {
                NSLog(@"获取成功 -- %@",buddyList);
                _friendsList = buddyList;
                
            }
        } onQueue:nil];
        
        
    }
    
    
    return _friendsList;
    
}

@end
