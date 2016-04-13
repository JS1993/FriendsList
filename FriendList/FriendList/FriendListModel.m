//
//  FriendListModel.m
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "FriendListModel.h"

@implementation FriendListModel
-(instancetype)initWithDict:(NSDictionary*)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray* arr=[NSMutableArray array];
        for (NSDictionary* dict in self.friends) {
            FriendModel* friendModel=[FriendModel friendModelWithDict:dict];
            [arr addObject:friendModel];
        }
        self.friendsList=arr;
    }
    return self;
}
+(instancetype)friendListModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
+(NSArray*)friendListModel{
    NSMutableArray* arrM=[NSMutableArray array];
    NSArray* arr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"]];
    for (NSDictionary* dic in arr ) {
        [arrM addObject:[self friendListModelWithDict:dic]];
    }
    return arrM;
}

@end
