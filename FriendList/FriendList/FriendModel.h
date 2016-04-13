//
//  FriendModel.h
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

@property(copy,nonatomic)NSString* icon;
@property(copy,nonatomic)NSString* intro;
@property(copy,nonatomic)NSString* name;
@property(nonatomic)int* vip;

+(instancetype)friendModelWithDict:(NSDictionary*)dict;
@end
