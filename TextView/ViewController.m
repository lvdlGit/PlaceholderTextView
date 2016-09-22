//
//  ViewController.m
//  TextView
//
//  Created by lvdl on 16/1/7.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "ViewController.h"
#import "PlaceholderTextView.h"

/**
 *  屏幕的宽和高
 */
#define SCREEN_HEIGHT_IPHONE ((SCREEN_WIDTH > SCREEN_HEIGHT) ? (SCREEN_WIDTH) : (SCREEN_HEIGHT))
#define SCREEN_WIDTH_IPHONE ((SCREEN_HEIGHT < SCREEN_WIDTH) ? (SCREEN_HEIGHT) : (SCREEN_WIDTH))

// 主窗口尺寸
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define     kFont(a)            [UIFont systemFontOfSize:a]

/**
 *  颜色
 */
#define  RGBA(r, g, b, a)   [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

@interface ViewController ()

@property (nonatomic, strong) PlaceholderTextView *address;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 地址 输入框
    CGRect memberFrame = CGRectMake(20, 50, SCREEN_WIDTH_IPHONE - 40, 97);
    _address = [[PlaceholderTextView alloc] initWithFrame:memberFrame];
    [self.view addSubview:_address];
    _address.backgroundColor = [UIColor cyanColor];
    _address.placeholder = [NSString stringWithFormat:@"请输入地址:"];
    _address.font = kFont(15);
    _address.textColor = RGBA(51, 51, 51, 1);
    
    _address.layer.cornerRadius = 13;
    _address.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
