//
//  HomeViewController.m
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/17.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import "HomeViewController.h"
#import "AlbumTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"hehe";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoTable:(id)sender {
    AlbumTableViewController * albumTableCtrl = [[AlbumTableViewController alloc] initWithNibName:@"AlbumTableViewController" bundle:nil];
    [self.navigationController pushViewController:albumTableCtrl animated:YES];
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
