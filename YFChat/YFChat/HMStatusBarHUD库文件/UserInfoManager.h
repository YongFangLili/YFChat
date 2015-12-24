//
//  UserInfoManager.h
//  YFChat
//
//  Created by 李永方 on 15/12/23.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManager : NSObject
+(instancetype) sharedUserInfoManager;

///用户信息属性
@property (nonatomic, strong) NSDictionary *UserInfo;
@property (nonatomic, strong) NSArray *friendsList;



@end
