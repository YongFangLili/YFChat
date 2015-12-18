//
//  ViewController.m
//  YFChat
//
//  Created by 李永方 on 15/12/17.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<IChatManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *pwdaccount;

@end

@implementation ViewController


- (IBAction)LoginButton:(id)sender {
    
    if (_accountText.text.length == 0) {
        return;
    }
    if (_pwdaccount.text.length == 0) {
        return;
    }
//    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:_accountText.text password:_pwdaccount.text completion:^(NSDictionary *loginInfo, EMError *error) {
//        if (!error && loginInfo) {
//            [HMStatusBarHUD showSuccess:@"登陆成功"];
//            
//            NSLog(@"登陆成功 %@",loginInfo);
//        }
//        
//    } onQueue:nil];
    
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:_accountText.text password:_pwdaccount.text completion:^(NSDictionary *loginInfo, EMError *error) {
        if (!error) {
            [HMStatusBarHUD showSuccess:@"登陆成功"];
            NSLog(@"登录成功 %@",loginInfo);

        }else{
             NSLog(@"-------》%@",loginInfo);
            [HMStatusBarHUD showSuccess:@"登录失败"];
            NSLog(@"登录失败 %@",error);
        
        }
    } onQueue:nil];
}



//注册
- (IBAction)regesterButton:(id)sender {
    
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_accountText.text password:_accountText.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
        
        if (!error){
            [HMStatusBarHUD showSuccess:@"注册成功"];
            NSLog(@"注册成功");
        }else {
            [HMStatusBarHUD showSuccess:@"注册失败"];
            NSLog(@"注册失败");
        
        }
    } onQueue:nil];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"打印iOS环信SDK版本号：%@",[EaseMob sharedInstance].sdkVersion);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
