//
//  HeaderView.h
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendListModel.h"
@interface HeaderView : UIView
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UIButton *headerButton;
+(instancetype)headerViewWithTableView:(UITableView*)tableView andFriendListModel:(FriendListModel*)listModel;
@end
