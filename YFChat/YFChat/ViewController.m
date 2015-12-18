//
//  ViewController.m
//  YFChat
//
//  Created by 李永方 on 15/12/17.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "ViewController.h"
#import <EaseMob.h>

@interface ViewController ()
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
    
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:_accountText.text password:_pwdaccount.text completion:^(NSDictionary *loginInfo, EMError *error) {
        
        NSLog(@"登录成功 %@",loginInfo);
    } onQueue:nil];
}



//注册
- (IBAction)regesterButton:(id)sender {
    
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_accountText.text password:_accountText.text withCompletion:^(NSString *username, NSString *password, EMError *error) {
        
        if (!error){
            NSLog(@"注册成功");
        }else {
            NSLog(@"注册失败");
        
        }
    } onQueue:nil];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
