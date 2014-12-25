//
//  ViewController.m
//  PageViewController
//
//  Created by 李玉峰 on 14/12/24.
//  Copyright (c) 2014年 李玉峰. All rights reserved.
//

#import "ViewController.h"
#import "CAIPageViewController.h"
#import "ColorViewController.h"

@interface ViewController ()<CAIPageViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAIPageViewController *page = [[CAIPageViewController alloc]initWithNibName:nil bundle:nil];
    [self.view addSubview:page.view];
    page.view.frame = self.view.bounds;
    page.delegate = self;
    [page registerClass:[ColorViewController class] forViewControllerWithReuseIdentifier:@"abc"];
    page.contentRect = CGRectMake(0, 100, 50, 300);
    [self addChildViewController:page];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfControllersInCAIViewController:(CAIPageViewController *)pageViewController{
    return 10;
}

-(UIViewController *)pageViewController:(CAIPageViewController *)pageViewController viewControllerForItemAtIndexPath:(NSInteger)index{
    ColorViewController * vc = [pageViewController dequeueReusableViewControllerWithReuseIdentifier:@"abc" forIndexPath:index];
    vc.view.backgroundColor = index%2?[UIColor redColor]:[UIColor blueColor];
    return vc;
}

@end
