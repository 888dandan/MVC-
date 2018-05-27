//
//  ATableViewCell.m
//  MVC模式运用
//
//  Created by 曹轩 on 2018/5/23.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "ATableViewCell.h"
#import "Amodel.h"

@interface  ATableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (weak, nonatomic) IBOutlet UILabel *myName;


@end

@implementation ATableViewCell

-(void)setModel:(Amodel *)model{
    _model=model;
    _myName.text=_model.name;
    _myImageView.image=[UIImage imageNamed:_model.image];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

// 此方法只要进入到tableviewcell 中就会触发 默认 selected 是no

// 开始的时候 tableView 的 cell 的selected 为0 当选中一个的时候 之前被选中的 cell 的selected 设置为0, 新选中的 cell 的selected设置为1;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
        NSLog(@"我被点击了");
//    if (_model.isSelect==NO&&selected==YES) {
//
//        [_selectBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
//        _model.isSelect=YES;
//    }
//    else{
//        [_selectBtn setImage:[UIImage imageNamed:@"unselected-"] forState:UIControlStateNormal];
//        _model.isSelect=NO;
//    }

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    NSLog(@"");
}


@end
