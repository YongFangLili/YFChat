//
//  NSString+HMNSStringExt.h
//  01-QQ聊天
//
//  Created by apple on 15/5/26.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (HMNSStringExt)
// 类方法
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

// 对象方法
- (CGSize)sizeOftextFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
