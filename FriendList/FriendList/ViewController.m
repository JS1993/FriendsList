//
//  ViewController.m
//  FriendList
//
//  Created by  江苏 on 16/4/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "FriendListModel.h"
#import "FriendModel.h"
#import "HeaderView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* firendList;
@end

@implementation ViewController
-(NSArray *)firendList{
    if (_firendList==nil) {
        _firendList=[FriendListModel friendListModel];
    }
    return _firendList;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

#pragma mark-数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.firendList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.firendList[section] friendsList].count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    FriendListModel* list=self.firendList[indexPath.section];
    FriendModel* friend=list.friendsList[indexPath.row];
    cell.textLabel.text=friend.name;
    cell.detailTextLabel.text=friend.intro;
    cell.imageView.image=[UIImage imageNamed:friend.icon];
    return cell;
}
#pragma mark-设置headView

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FriendListModel* list=self.firendList[section];
    return [HeaderView headerViewWithTableView:tableView andFriendListModel:list];
}
@end
