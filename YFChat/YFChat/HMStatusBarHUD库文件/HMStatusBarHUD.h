//
//  HMStatusBarHUD.h
//  新闻详情
//
//  Created by apple on 20/6/20.
//  Copyright (c) 2020年 itheima. All rights reserved.
//

/**
    1> 资源管理问题 (图片)  打包图片\音频等资源 到bundle中
 
    2> 框架升级
        1. 不要轻易修改以前的方法名  1.0 --> 2.0
        2. 如果旧方法过期,最好保留旧方法,并通过苹果提供的预编译指令提醒应该使用哪个新方法
 + (void)showSuccess:(NSString *)msg NS_DEPRECATED_IOS(2_0, 3_0, "请使用xxxx方法!!!");
 
    3> 开源  --> 如何跟github联系起来? github : 代码托管平台
 
    4> 闭源 :
        1. 如果想让别人用你的东西,但是又不想公开源代码 所有的.m文件 -->编译 --> 库文件 (静态库 \ 动态库文件)
    .h .m  SDK
 
*/

#import <UIKit/UIKit.h>


@interface HMStatusBarHUD : NSObject
/**
 *  显示信息 (此方法已过期,建议使用XXXX方法 )
 *
 *  @param msg   文字内容
 *  @param image 图片对象
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示信息
 *
 *  @param msg       文字内容
 *  @param imageName 图片名称 (图片高度最好在 20 以内, 仅限于本地图片)
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;
/**
 *  显示成功信息
 *
 *  @param msg 文字信息
 */
+ (void)showSuccess:(NSString *)msg; // NS_DEPRECATED_IOS(2_0, 3_0, "请使用xxxx方法!!!");

/**
 *  显示失败信息
 *
 *  @param msg 文字信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示登录
 *
 *  @param msg 文字信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏窗口
 */
+ (void)hideLoading;

@end
