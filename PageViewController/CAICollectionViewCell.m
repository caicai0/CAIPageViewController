//
//  CAICollectionViewCell.m
//  PageViewController
//
//  Created by 李玉峰 on 14/12/24.
//  Copyright (c) 2014年 李玉峰. All rights reserved.
//

#import "CAICollectionViewCell.h"

@implementation CAICollectionViewCell

- (void)setViewController:(UIViewController *)viewController{
    if (viewController !=_viewController) {
        _viewController = viewController;
        [self.contentView addSubview:viewController.view];
    }
}

@end
