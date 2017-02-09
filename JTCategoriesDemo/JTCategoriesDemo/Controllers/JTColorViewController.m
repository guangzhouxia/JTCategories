//
//  JTColorViewController.m
//  JTCategoriesDemo
//
//  Created by YS-160408B on 17/2/9.
//  Copyright © 2017年 JT. All rights reserved.
//

#import "JTColorViewController.h"
#import "UIColor+JTAdd.h"

@interface JTColorViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation JTColorViewController

static NSString *collectID = @"collectID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80.f, 80.f);
    layout.minimumLineSpacing = 10.0f;
    layout.minimumInteritemSpacing = 10.0f;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectID];
    [self.view addSubview:_collectionView];
    
    UIColor *color1 = [UIColor colorWithHex:0xFFD700];
    UIColor *color2 = [UIColor colorWithHex:0xFFB6C1 alpha:0.5];
    
    UIColor *color3 = [UIColor colorWithHexString:@"EEE"];
    
    UIColor *color4 = [UIColor colorWithHexString:@"#EEE5DE"];
    UIColor *color5 = [UIColor colorWithHexString:@"0XEEE5DE"];
    UIColor *color6 = [UIColor colorWithHexString:@"0XEEE5DEee"];
    
    UIColor *color7 = [UIColor colorWithHexString:@"EEEE00" alpha:0.5];
    UIColor *color8 = [UIColor colorWithHexString:@"#EEEE00" alpha:1.0];
    UIColor *color9 = [UIColor colorWithHexString:@"0XEEEE00" alpha:1.0];
    
    _dataSource = [NSMutableArray arrayWithObjects:color1, color2, color3, color4, color5, color6, color7, color8, color9, nil];
    
}

#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectID forIndexPath:indexPath];
    
    UIColor *color = self.dataSource[indexPath.row];
    cell.backgroundColor = color;
    return cell;
}

@end
