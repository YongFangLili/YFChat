//
//  ViewController.m
//  YFChat
//
//  Created by 李永方 on 15/12/17.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "ViewController.h"
#import "YFMainChatViewController.h"
#import "UserInfoManager.h"

@interface ViewController ()<IChatManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *pwdaccount;
@property (strong, nonatomic) NSDictionary *userInfo;
@property (strong , nonatomic) NSArray *friendList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册一个通知，用于登录的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MineChat:) name:KNOTIFICATION_LOGINCHANGE object:nil];
    NSLog(@"打印iOS环信SDK版本号：%@",[EaseMob sharedInstance].sdkVersion);
    //从沙盒中获取账号与密码
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (ud != nil) {
        self.accountText.text = [ud objectForKey:@"em_lastLogin_username"];
    }
    
}


- (IBAction)LoginButton:(id)sender {
    
    if (_accountText.text.length == 0) {
        return;
    }
    if (_pwdaccount.text.length == 0) {
        return;
    }

    [self loginWithUserName:_accountText.text password:_pwdaccount.text];


}

//点击登录后的操作
-(void)loginWithUserName:(NSString *)userName password:(NSString *)password {

    //异步账号登录
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:userName password:password completion:^(NSDictionary *loginInfo, EMError *error) {
        
        if (loginInfo && !error) {
    
        //设置是否是自动登录状态
        [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
//        // 旧数据转换 (如果您的sdk是由2.1.2版本升级过来的，需要家这句话)
//        [[EaseMob sharedInstance].chatManager importDataToNewDatabase];
        //获取数据库中数据
        [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
        
        //获取群组列表
        [[EaseMob sharedInstance].chatManager asyncFetchMyGroupsList];
        //获取好友列表
//        [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
            
            [[EaseMob sharedInstance].chatManager asyncFetchBuddyListWithCompletion:^(NSArray *buddyList, EMError *error) {
                if (!error) {
                    NSLog(@"获取成功 -- %@",buddyList);
                    [UserInfoManager sharedUserInfoManager].friendsList = buddyList;
                     NSLog(@"-------%s",__func__);
                    //发送自动登录状态通知的状态
                    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES userInfo:loginInfo];
                }
            } onQueue:nil];
        
        [HMStatusBarHUD showSuccess:@"登录成功"];
        //用单例保存用户登录信息
        [UserInfoManager sharedUserInfoManager].UserInfo = loginInfo;
       
        
//        //发送自动登录状态通知的状态
//        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES userInfo:loginInfo];
            
        //保存最近一次登录用户名
        [self saveLastLoginUsername];
        
        }else{
            
            
            if (error.errorCode == EMErrorServerAuthenticationFailure) {
                [HMStatusBarHUD showError:@"您输入的用户名或者密码错误！"];
                
            }else{
                NSLog(@"-------》%@",loginInfo);
                [HMStatusBarHUD showError:@"登录失败,网络不给力哦"];
                NSLog(@"登录失败 %ld",(long)error.errorCode);

                }
            }
        
    } onQueue:nil];

}

//获取好友列表

///保存登录的用户名
- (void)saveLastLoginUsername
{
    NSString *username = [[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:kSDKUsername];
    if (username && username.length > 0) {
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:username forKey:[NSString stringWithFormat:@"em_lastLogin_%@",kSDKUsername]];
        [ud synchronize];
        NSLog(@"%@",NSHomeDirectory());
    }
}


//注册
- (IBAction)regesterButton:(id)sender {
    
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_accountText.text password:_pwdaccount.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
        
        if (!error){
            [HMStatusBarHUD showSuccess:@"注册成功"];
            NSLog(@"注册成功");
        }else {
            [HMStatusBarHUD showSuccess:@"注册失败"];
            NSLog(@"注册失败");
        
        }
    } onQueue:nil];
}


//进入到我的主页界面

-(void)MineChat:(NSNotification *)Notification {
    
    NSLog(@"%@",Notification);
    
    
    YFMainChatViewController *ChatVC = [[YFMainChatViewController alloc]init];
    ChatVC.view.backgroundColor = [UIColor redColor];
    ChatVC.userInfo = Notification.userInfo;
    [self.navigationController pushViewController:ChatVC animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
     YFMainChatViewController *ChatVC = [[YFMainChatViewController alloc]init];
    ChatVC = segue.destinationViewController;
    ChatVC.userInfo = self.userInfo;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
