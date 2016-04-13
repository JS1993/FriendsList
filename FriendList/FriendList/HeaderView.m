//
//  HeaderView.m
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView


+(instancetype)headerViewWithTableView:(UITableView*)tableView andFriendListModel:(FriendListModel*)listModel{
//    NSString* identi=@"headerView";
//    HeaderView* headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:identi];
    HeaderView*     headerView=[[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
    [headerView.headerButton setTitle:listModel.name forState:UIControlStateNormal];
    [headerView.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    headerView.headerLabel.text=[NSString stringWithFormat:@"%d/%lu",listModel.online,(unsigned long)listModel.friendsList.count];
    return headerView;
}
@end
