//
//  ViewController.m
//  0723弧形滑块
//
//  Created by 孙文君 on 15/7/24.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "ViewController.h"
#import "RHuDuView.h"
#import "UIView+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet RHuDuView *drawView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property(nonatomic,weak)UIButton  *btn;

@end

@implementation ViewController
- (IBAction)sliderChange:(UISlider *)sender {
    
    self.drawView.process = sender.value;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGFloat x = self.drawView.bounds.size.width*0.2;
    CGFloat y = self.drawView.bounds.size.width*0.5;
    UIButton *btn  = [[UIButton alloc] init];
    btn.width  =20;
    btn.height  =20;
    btn.center  =CGPointMake(x, y);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [self.drawView addSubview:btn];
    self.drawView.btn = btn;
    self.btn = btn;
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveBtn:)];
    
    [btn addGestureRecognizer:pan];
}
-(void)moveBtn:(UIPanGestureRecognizer *)pan
{
    //NSLog(@"%@",  NSStringFromCGPoint([pan translationInView:self.drawView]));
    
//    CGPoint tran  =[pan translationInView:self.drawView];
//    [pan setTranslation:CGPointZero inView:self.drawView];
    
    //计算弧度
     CGPoint location =[pan locationInView:self.drawView];
    
    NSLog(@"%@",NSStringFromCGPoint(location));
    
    
        self.drawView.currentLocation  =location;
    //self.btn.transform  =CGAffineTransformTranslate(self.btn.transform, tran.x, tran.y);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    
//    
//    
//    anim.keyPath = @"position";
//    
//    anim.removedOnCompletion = NO;
//    
//    anim.fillMode = kCAFillModeForwards;
//    
//    anim.duration = 2.0;
//    
//    
//    
//    CGMutablePathRef path1 = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path1, NULL, CGRectMake(100, 100, 200, 200));
//
//    
//    anim.path = path1;
//    
//    CGPathRelease(path1);
//    
//    [self.btn.layer addAnimation:anim forKey:nil];
//}

@end
