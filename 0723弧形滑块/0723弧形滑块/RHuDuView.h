//
//  RHuDuView.h
//  0723弧形滑块
//
//  Created by 孙文君 on 15/7/24.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHuDuView : UIView

@property(nonatomic,assign)CGFloat process;//slider进度

@property(nonatomic,strong)UIButton *btn;//按钮btn

@property(nonatomic,assign)CGFloat currentAngel;//滑动点当前弧度

@property(nonatomic,assign)CGPoint currentLocation;//当前接触点的坐标
@end
