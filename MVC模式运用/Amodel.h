//
//  Amodel.h
//  MVC模式运用
//
//  Created by 曹轩 on 2018/5/23.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Amodel : NSObject

@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) NSString *name;

@property(nonatomic,assign) BOOL isSelect; // 默认是no

@end
