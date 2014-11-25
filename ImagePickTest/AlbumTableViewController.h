//
//  AlbumTableViewController.h
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/17.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AlbumTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *assetsGroups;
@property (nonatomic, retain) ALAssetsLibrary *assetsLibrary;
@end
