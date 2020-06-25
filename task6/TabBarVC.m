//
//  TabBarVC.m
//  task6
//
//  Created by Yury Silantyev on 25.06.2020.
//  Copyright © 2020 Yury Silantyev. All rights reserved.
//

#import "TabBarVC.h"
#import "TableVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];

    TableVC *tableVC = [TableVC new];
    NSArray *tabViewControllers = @[tableVC];
    
    tableVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    tableVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tableVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    tableVC.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image:[[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:2];
    [self setViewControllers:tabViewControllers];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
