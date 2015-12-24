//
//  YFMainChatViewController.m
//  YFChat
//
//  Created by 李永方 on 15/12/23.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "YFMainChatViewController.h"
#import "UserInfoManager.h"

@interface YFMainChatViewController ()

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
    
    NSLog(@"-------%s",__func__);
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
