//
//  PhotoCollectionViewCell.h
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/20.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface PhotoCollectionViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *photoImage;
    __weak IBOutlet UIImageView *selectImage;
}
-(void)setData:(ALAsset *)asset;
-(void)selectState;
-(void)deselectState;
@end
