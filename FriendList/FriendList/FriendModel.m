//
//  FriendModel.m
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel
-(instancetype)initWithDict:(NSDictionary*)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}

@end
