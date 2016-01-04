//
//  YFChatCell.m
//  YFChat
//
//  Created by 李永方 on 15/12/30.
//  Copyright © 2015年 李永方. All rights reserved.
//

#import "YFChatCell.h"

@interface YFChatCell ()
@property (nonatomic,weak) UILabel *lblTime;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UIButton *btnText;
@end

@implementation YFChatCell

- (void)setMessageFrame:(HMMessageFrame *)messageFrame {

    _messageFrame = messageFrame;
    
    //给数据赋值
    
    
    //3.创建 view
//    // 创建图片
//    UIImage *norImage = [UIImage imageNamed:nor];
//    UIImage *highlightedImage = [UIImage imageNamed:highlighted];
//    
//    norImage = [norImage stretchableImageWithLeftCapWidth:norImage.size.width * 0.5 topCapHeight:norImage.size.height * 0.5];
//    highlightedImage = [highlightedImage stretchableImageWithLeftCapWidth:highlightedImage.size.width * 0.5 topCapHeight:highlightedImage.size.height * 0.5];
    //设置按钮背景
//    [self.btnText setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>]


}

+(instancetype)messageCellWithTableView:(UITableView *)tableView
{

    static NSString *ID = @"message_cell";
    
    YFChatCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[YFChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

//重写 initwith 方法

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //动态创建子控件
        [self setUpUI];
    }
    self.backgroundColor = [UIColor grayColor];
    return  self;
}

//创建 UI 布局

-(void)setUpUI {
    UILabel *lblTime = [[UILabel alloc] init];
    [self.contentView addSubview:lblTime];
    //设置字体的大小
    lblTime.font = [UIFont systemFontOfSize:12];
    lblTime.textAlignment = NSTextAlignmentCenter;
    self.lblTime = lblTime;
    [self.lblTime sizeToFit];
    
    //头像
    UIImageView *ImageViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    ImageViewIcon.image =  [UIImage imageNamed:@"me"];
    [self.contentView addSubview:ImageViewIcon];
    self.iconView = ImageViewIcon;
    
    //消息正文
    UIButton *btnText = [[UIButton alloc] initWithFrame:CGRectMake(10 + CGRectGetMaxX(self.iconView.frame), 40, 120, 30)];
    [self.contentView addSubview:btnText];
    
    //设置字体颜色
    [btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnText setTitle:@"jndjknjnkm,sghthr" forState:UIControlStateNormal];
    btnText.titleLabel.font = [UIFont systemFontOfSize:12];
    // 设置按钮内容内边距
//    btnText.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    self.btnText.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
   

    self.btnText = btnText;
//    [self.btnText sizeToFit];
    CGSize size = [@"jndjknjnkm,sghthr" boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil].size;
    self.btnText.frame = CGRectMake(10 + CGRectGetMaxX(self.iconView.frame), 40, size.width+40, 30);
    // 创建图片
    UIImage *norImage = [UIImage imageNamed:@"chat_recive_nor"];
    norImage = [norImage stretchableImageWithLeftCapWidth:norImage.size.width * 0.5 topCapHeight:norImage.size.height * 0.5];
    [btnText setBackgroundImage:norImage forState:UIControlStateNormal];

    
    btnText.titleLabel.numberOfLines = 0;
    // 设置按钮内容内边距
//    self.btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 30, 20);

}


//设置 cell 的高度

+(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;

}

@end
