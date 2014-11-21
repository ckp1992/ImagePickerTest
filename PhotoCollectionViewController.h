//
//  PhotoCollectionViewController.h
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/19.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#define MAX_SELECT_COUNT 6
@interface PhotoCollectionViewController : UICollectionViewController
@property (nonatomic, retain) NSMutableArray *assets;
@property (nonatomic, retain) ALAssetsGroup *assetsGroup;
@property (nonatomic, retain) NSMutableArray *imageArray;

@end
