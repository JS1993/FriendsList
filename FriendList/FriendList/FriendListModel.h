//
//  FriendListModel.h
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendModel.h"
@interface FriendListModel : NSObject
@property(strong,nonatomic)NSArray* friends;
@property(copy,nonatomic)NSString* name;
@property(nonatomic)int online;
@property(strong,nonatomic)NSArray* friendsList;

@end
