//
//  AViewController.m
//  MVC模式运用
//
//  Created by 曹轩 on 2018/5/23.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "AViewController.h"
#import "ATableViewCell.h"
#import "Amodel.h"

@interface AViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic,strong) NSMutableArray *souceArr;
// btnArr
@property(nonatomic,strong) NSMutableArray *btnArr;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _souceArr=[[NSMutableArray alloc]init];
    _btnArr=[[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view from its nib.
    [self CXTableViewInit];
    // 相当于网络请求
    [self addSouce];
    
    
}
//添加资源
-(void)addSouce{
    NSArray *imageArr=@[@"qq_login_img",@"sina_login_img",@"wechat_login_img"];
    NSArray *nameAr=@[@"qq",@"新浪微博",@"微信"];
    
    for (NSInteger i=0; i<3; i++) {
        Amodel *model=[[Amodel alloc]init];
        
        model.image=imageArr[i];
        model.name=nameAr[i];
        model.isSelect=NO;
        [_souceArr addObject:model];
    }
    [self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma uitabelViewDelegate and uitableDateSouce-
-(void)CXTableViewInit{
    
    self.myTableView.backgroundColor=[UIColor whiteColor];
    self.myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 59;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _souceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell类名
    static NSString *inentifier=@"ATableViewCell";
    
    ATableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:inentifier];
    if (!cell) {
        
        cell=[[[NSBundle mainBundle]loadNibNamed:inentifier owner:nil options:nil]firstObject];
        
    }
    Amodel *model=_souceArr[indexPath.row];
    
    [cell.selectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 添加
    [_btnArr addObject:cell.selectBtn];
    
    //点语法将model 传递到view
    cell.model=model;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIButton *btn=_btnArr[indexPath.row];
    [self btnClick:btn];
    
    NSLog(@"我在vc界面被点击");
}
// cell 的 选择按钮点击事件
-(void)btnClick:(UIButton*)btn{
    // btn 的select 属性默认是 no select 属性是我们手动改变的，不能通过点击btn 自动改变 之前理解错了
    if (!btn.selected) {
        
        [btn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        // 然后将select属性改成yes
        [btn setSelected:YES];
    }
    else{
        [btn setImage:[UIImage imageNamed:@"unselected-"] forState:UIControlStateNormal];
        // 然后将select 属性改成no
        [btn setSelected:NO];
    }
}
#pragma   tableViewdelegate tableViewDateSouce end

@end
