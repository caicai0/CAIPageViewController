//
//  CAIPageViewController.h
//  PageViewController
//
//  Created by 李玉峰 on 14/12/24.
//  Copyright (c) 2014年 李玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CAIPageViewController;

@protocol CAIPageViewControllerDelegate <NSObject>

@required
- (NSInteger)numberOfControllersInCAIViewController:(CAIPageViewController *)pageViewController;

- (UIViewController *)pageViewController:(CAIPageViewController *)pageViewController viewControllerForItemAtIndexPath:(NSInteger )index;

@end

@interface CAIPageViewController : UIViewController

@property (nonatomic, weak)id<CAIPageViewControllerDelegate> delegate;

//自定义内容的大小 只能继承 在初始化方法中修改
@property (nonatomic, assign)CGRect contentRect;

//自动 调用 - (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)registerClass:(Class)aClass forViewControllerWithReuseIdentifier:(NSString *)reuseIdentifier;
//自动重用方法
- (id)dequeueReusableViewControllerWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSInteger)index;

@end
