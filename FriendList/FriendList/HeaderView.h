//
//  HeaderView.h
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendListModel.h"

@class HeaderView;
typedef void(^HeaderViewBlock)(id);


@protocol HeaderViewDelegate<NSObject>
-(void)headerView:(HeaderView* )headerView;

@end


@interface HeaderView : UIView

@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UIButton *headerButton;

@property(nonatomic,strong)FriendListModel* listModel;
@property(nonatomic,strong)id<HeaderViewDelegate> delegate;
@property(nonatomic,copy)HeaderViewBlock block;

+(instancetype)headerView;
@end
