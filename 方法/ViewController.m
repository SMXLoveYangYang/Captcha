//
//  ViewController.m
//  方法
//
//  Created by cdfy on 16/6/22.
//  Copyright © 2016年 cdfy. All rights reserved.
//

#import "ViewController.h"

#define RED_COLOR [UIColor redColor]
#define WIDTH 200
@interface ViewController ()
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, assign) int z;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _x = 0;
    _y = 60;
    _z = 0;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 3;
    btn.frame = CGRectMake(50, 50, 100, 40);
    [btn addTarget:self action:@selector(dianji) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel * hongse_Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    hongse_Label.tag = 1;
    hongse_Label.text = @"获取验证码";
    hongse_Label.textColor = [UIColor redColor];
    hongse_Label.font = [UIFont systemFontOfSize:18];
    hongse_Label.backgroundColor = [UIColor whiteColor];
    hongse_Label.layer.borderWidth = 1;
    hongse_Label.layer.borderColor = [UIColor blackColor].CGColor;
    hongse_Label.layer.cornerRadius = 10;
    hongse_Label.layer.masksToBounds = YES;
    hongse_Label.textAlignment = NSTextAlignmentCenter;
    [btn addSubview:hongse_Label];
    
    UILabel * huise_Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    huise_Label.tag = 2;
    huise_Label.textColor = [UIColor whiteColor];
    huise_Label.backgroundColor = [UIColor grayColor];
    huise_Label.layer.borderColor = [UIColor grayColor].CGColor;
    huise_Label.layer.borderWidth = 1;
    huise_Label.layer.cornerRadius = 10;
    huise_Label.layer.masksToBounds = YES;
    huise_Label.textAlignment = NSTextAlignmentCenter;
    huise_Label.font = [UIFont systemFontOfSize:18];
    huise_Label.alpha = 0.4;
    [btn addSubview:huise_Label];

    huise_Label.hidden = YES;
}
- (void)dianji{
    UILabel * hongse = (UILabel *)[self.view viewWithTag:1];
    UILabel * huise = (UILabel *)[self.view viewWithTag:2];
    hongse.hidden = YES;
    huise.hidden = NO;
    UIButton * btn = (UIButton *)[self.view viewWithTag:3];
    btn.userInteractionEnabled = NO;
    
    if (btn.userInteractionEnabled == NO) {
        if (_z == 0) {
            [self xianshi];
        }else{
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(xianshi) userInfo:nil repeats:NO];
        }
    }
}
- (void)xianshi{
    _z = 1;
    UILabel * hongse = (UILabel *)[self.view viewWithTag:1];
    UILabel * huise = (UILabel *)[self.view viewWithTag:2];
    UIButton * btn = (UIButton *)[self.view viewWithTag:3];

    huise.text = [NSString stringWithFormat:@"还剩%d秒",_y];
    _y -= 1;
    
    if (_y == -1) {
        btn.userInteractionEnabled = YES;
        _y = 60;
        hongse.hidden = NO;
        huise.hidden = YES;
        _z = 0;
        [self ok];
    }else{
        [self dianji];
    }
}
- (void)ok{
    NSLog(@"循环结束");
}
@end
