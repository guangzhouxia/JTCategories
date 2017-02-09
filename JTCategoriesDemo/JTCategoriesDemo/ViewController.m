//
//  ViewController.m
//  JTCategoriesDemo
//
//  Created by YS-160408B on 17/2/9.
//  Copyright © 2017年 JT. All rights reserved.
//

#import "ViewController.h"
#import "JTModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _dataSource = [NSMutableArray array];
    
    JTModel *colorModel = [[JTModel alloc] init];
    colorModel.content = @"color add";
    colorModel.className = @"JTColorViewController";
    
    [_dataSource addObject:colorModel];
}

#pragma mark - tableView dataSource, delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    JTModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.content;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JTModel *model = self.dataSource[indexPath.row];
    
    id class = NSClassFromString(model.className);
    
    if (class) {
        id viewController = [[class alloc] init];
        if ([viewController isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
