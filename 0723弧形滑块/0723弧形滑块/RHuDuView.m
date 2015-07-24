//
//  RHuDuView.m
//  0723弧形滑块
//
//  Created by 孙文君 on 15/7/24.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "RHuDuView.h"
#import "UIView+Extension.h"
#import <math.h>
@interface RHuDuView ()

@property(nonatomic,assign)CGFloat preAngel;

@property(nonatomic,assign)CGPoint centerLocation;//中心点坐标



@end

@implementation RHuDuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

-(CGPoint)centerLocation
{
    return CGPointMake(self.width*0.5,self.height*0.5);
}
-(void)setProcess:(CGFloat)process
{
    _process  =process;
   // [self setNeedsDisplay];
}

-(void)setCurrentAngel:(CGFloat)currentAngel
{
    _currentAngel = currentAngel;
    [self setNeedsDisplay];
}

-(void)setCurrentLocation:(CGPoint)currentLocation
{
    _currentLocation  =currentLocation;
    //根据坐标计算当前弧度；
    
    CGFloat merY = currentLocation.y - self.centerLocation.y;
    CGFloat merX = currentLocation.x - self.centerLocation.x;
    
    CGFloat ang = 0;
    
    if (currentLocation.x<0.5*self.width) {
         ang = atan(merY/merX)-M_PI;
    }else{
         ang = atan(merY/merX);

    }
    if (ang>M_PI_4 && ang<M_PI_2) {
        ang = M_PI_4;
    }
    if (ang>M_PI_2||ang<-M_PI*1.25) {
        ang = -M_PI*1.25;
    }
    NSLog(@"%f",ang);
    self.currentAngel = ang;

}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //画底线
    
    
//  画弧线
    CGPoint center = CGPointMake(rect.size.width*0.5, rect.size.width*0.5);
    CGFloat radius = MIN(rect.size.width, rect.size.height)*0.3;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI*1.25 endAngle:M_PI_4 clockwise:YES];
    path.lineWidth=10;
    [[UIColor blackColor] set];
    [path stroke];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI*1.25 endAngle:self.currentAngel clockwise:YES];
    
    
    path1.lineWidth=10;
    //[path addLineToPoint:center];
    
    [[UIColor blueColor] set];
    [path1 stroke];
//    CGContextAddPath(ctx,path.CGPath);
//    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    
    //让滑块位置改变
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    
    
    anim.keyPath = @"position";
    
    anim.removedOnCompletion = NO;
    
    anim.fillMode = kCAFillModeForwards;
    
    
    BOOL wise = (self.currentAngel>_preAngel);

   UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:_preAngel endAngle:self.currentAngel clockwise:wise];
    
    
    anim.path = [path2 CGPath];
        
    [self.btn.layer addAnimation:anim forKey:nil];
    
    //把点的弧度值副给 前值
    _preAngel =self.currentAngel;
//    NSLog(@"%@",NSStringFromCGPoint(self.btn.layer.));
}


@end
