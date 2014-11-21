//
//  PhotoCollectionViewCell.m
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/20.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code

    
}

-(void)setData:(ALAsset *)asset{
    CGImageRef thum = [asset thumbnail];
    UIImage* image = [UIImage imageWithCGImage:thum];
    photoImage.image = image;
}
-(UIImage*)getImageData{
    return photoImage.image;
}
-(void)selectState{
    photoImage.alpha = 0.4;
    selectImage.hidden = NO;
}
-(void)deselectState{
    photoImage.alpha = 1;
    selectImage.hidden = YES;
}
@end
