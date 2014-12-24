//
//  CAIPageViewController.m
//  PageViewController
//
//  Created by 李玉峰 on 14/12/24.
//  Copyright (c) 2014年 李玉峰. All rights reserved.
//

#import "CAIPageViewController.h"
#import "CAICollectionViewCell.h"

@interface CAIPageViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableDictionary *reuseIdentifierDictionary;

@end

@implementation CAIPageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.reuseIdentifierDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.flowLayout.itemSize = self.view.bounds.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - public

- (void)setContentRect:(CGRect)contentRect{
    if (!CGRectEqualToRect(contentRect, _contentRect)) {
        _contentRect = contentRect;
        self.flowLayout.itemSize = _contentRect.size;
        self.collectionView.frame = _contentRect;
    }
}

- (void)registerClass:(Class)aClass forViewControllerWithReuseIdentifier:(NSString *)reuseIdentifier{
    [self.reuseIdentifierDictionary setObject:NSStringFromClass(aClass) forKey:reuseIdentifier];
    [self.collectionView registerClass:[CAICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (id)dequeueReusableViewControllerWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSInteger)index{
    CAICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    if (cell&&!cell.viewController) {
        NSString * className = self.reuseIdentifierDictionary[identifier];
        Class controllerClass = NSClassFromString(className);
        if ([controllerClass isSubclassOfClass:[UIViewController class]]) {
            cell.viewController = [[controllerClass alloc]init];
        }
    }
    return cell.viewController;
}
#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.delegate numberOfControllersInCAIViewController:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * controller = [self.delegate pageViewController:self viewControllerForItemAtIndexPath:indexPath.item];
    CAICollectionViewCell * cell = (CAICollectionViewCell *)controller.view.superview.superview;
    return cell;
}

@end
