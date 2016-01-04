//
//  YFChatCell.h
//  YFChat
//
//  Created by 李永方 on 15/12/30.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMMessageFrame;

@interface YFChatCell : UITableViewCell

@property(nonatomic, strong) HMMessageFrame *messageFrame;

+ (instancetype)messageCellWithTableView:(UITableView *)tableView;

+(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
