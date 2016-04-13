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
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HeaderViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* firendList;
@property(nonatomic)BOOL listIsOpen;
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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clicked) name:@"clicked" object:nil];
}
/**
 *  通知方法
 */
-(void)clicked{
//    [self.tableView reloadData];
    NSLog(@"执行了通知方法");
}
#pragma mark-数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.firendList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    FriendListModel* listModel=self.firendList[section];
    if (listModel.isOpen==1) {
        return listModel.friends.count;
    }else{
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    FriendListModel* list=self.firendList[indexPath.section];
    FriendModel* friend=list.friendsList[indexPath.row];
    if (friend.vip==1) {
        cell.textLabel.textColor=[UIColor redColor];
    }
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
    HeaderView* headerView=[HeaderView headerView];
    headerView.listModel=self.firendList[section];
    headerView.delegate=self;
    //使用block更新界面
    headerView.block=^(id sender){
        [tableView reloadData];
        NSLog(@"执行了block方法");
    };
    return headerView;
}

#pragma mark-headerDelegate
/**
 *  代理方法
 */
-(void)headerView:(HeaderView *)headerView{
//    [self.tableView reloadData];
    NSLog(@"执行代理方法");
}

-(void)dealloc{
    //当界面销毁时注销监听器
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
