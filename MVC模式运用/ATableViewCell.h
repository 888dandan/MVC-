//
//  ATableViewCell.h
//  MVC模式运用
//
//  Created by 曹轩 on 2018/5/23.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Amodel;

@interface ATableViewCell : UITableViewCell

// 选择按钮
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property(nonatomic,strong) Amodel *model;

@end
