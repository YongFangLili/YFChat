//
//  NSString+HMNSStringExt.m
//  01-QQ聊天
//
//  Created by apple on 15/5/26.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "NSString+HMNSStringExt.h"

@implementation NSString (HMNSStringExt)
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeOftextFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [NSString sizeWithText:self font:font maxSize:maxSize];
}
@end
