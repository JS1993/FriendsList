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
        //设置图片容纳格式
        self.headerButton.imageView.contentMode=UIViewContentModeCenter;
        //不允许剪切蒙版
        self.headerButton.imageView.clipsToBounds=NO;
        //设置按钮内部文字和图片的距离
        self.headerButton.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        //设置按钮内边距
        self.headerButton.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        //设置按钮文字颜色
        [self.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
-(void)awakeFromNib{
        if (self.listModel.isOpen==1) {
            //改变按钮左边图片的角度
            self.headerButton.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
        }
}

+(instancetype)headerView:(FriendListModel*)listModel{
    HeaderView* view=[[self alloc]init];
    //设置按钮文字
    [view.headerButton setTitle:listModel.name forState:UIControlStateNormal];
    //设置右边标签
    view.headerLabel.text=[NSString stringWithFormat:@"%d/%lu",listModel.online,(unsigned long)listModel.friendsList.count];
    return view;
}

//界面重新布局时调用
-(void)layoutSubviews{

}

//当前界面加载到父控件时调用
-(void)didMoveToSuperview{
    if (self.listModel.isOpen==1) {
        //改变按钮左边图片的角度
        self.headerButton.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.headerButton.imageView.transform=CGAffineTransformMakeRotation(0);
    }
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
