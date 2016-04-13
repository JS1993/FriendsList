//
//  HeaderView.m
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(instancetype)init{
    if (self) {
        self=[[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    }
    return self;
}

+(instancetype)headerView{
    return  [[self alloc]init];
}

//界面重新布局时调用
-(void)layoutSubviews{
    //设置按钮内部文字和图片的距离
    self.headerButton.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    //设置按钮内边距
    self.headerButton.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    //设置按钮文字
    [self.headerButton setTitle:self.listModel.name forState:UIControlStateNormal];
    //设置按钮文字颜色
    [self.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置右边标签
    self.headerLabel.text=[NSString stringWithFormat:@"%d/%lu",self.listModel.online,(unsigned long)self.listModel.friendsList.count];
}

- (IBAction)headerButtonClicked:(UIButton *)sender {
    self.listModel.isOpen=!self.listModel.isOpen;
    //判断代理
    if ([self.delegate respondsToSelector:@selector(headerView:)]) {
        [self.delegate headerView:self];
    }
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clicked" object:nil];
    //使用block
    if (self.block) {
        self.block(self);
    }
}
@end
