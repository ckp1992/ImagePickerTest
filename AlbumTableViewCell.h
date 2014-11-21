//
//  AlbumTableViewCell.h
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/17.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface AlbumTableViewCell : UITableViewCell
{
    __weak IBOutlet UIImageView *albumImageView;
    __weak IBOutlet UILabel *title;
    __weak IBOutlet UILabel *count;
}

-(void)initData:(ALAssetsGroup *)assetsGroup;

@end
