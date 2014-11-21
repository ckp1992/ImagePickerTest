//
//  AlbumTableViewCell.m
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/17.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import "AlbumTableViewCell.h"

@implementation AlbumTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initData:(ALAssetsGroup *)assetsGroup
{
    albumImageView.image = [UIImage imageWithCGImage:assetsGroup.posterImage];
    title.text = [NSString stringWithFormat:@"%@", [assetsGroup valueForProperty:ALAssetsGroupPropertyName]];
    count.text = [NSString stringWithFormat:@"(%d)", assetsGroup.numberOfAssets];
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    NSLog(@"highlighted:%hhd",highlighted);
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        [self.contentView setBackgroundColor:[UIColor grayColor]];
    }else{
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
    }
    
}
@end
