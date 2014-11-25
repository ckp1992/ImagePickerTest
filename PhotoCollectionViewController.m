//
//  PhotoCollectionViewController.m
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/19.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewController ()
{
    UIBarButtonItem *doneBtn ;
}

@end

@implementation PhotoCollectionViewController


static NSString * const reuseIdentifier = @"PhotoCollectionViewCell";
-(instancetype)init{
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize                     = CGSizeMake(78.0f, 78.0f);
    layout.sectionInset                 = UIEdgeInsetsMake(9.0, 0, 0, 0);
    layout.minimumInteritemSpacing      = 2.0;
    layout.minimumLineSpacing           = 2.0;
    layout.footerReferenceSize          = CGSizeMake(0, 44.0);
    
    if (self = [super initWithCollectionViewLayout:layout]){
       self.collectionView.allowsMultipleSelection = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:@"PhotoCollectionViewCell"];
    
    //*******测试
//    
//    NSLog(@"----1111%@",self.assets);
    self.assets = [NSMutableArray new];
    
    doneBtn = [[UIBarButtonItem alloc] init];
    doneBtn.title = @"完成";
    self.navigationItem.rightBarButtonItem = doneBtn;
    [doneBtn setTarget:self];
    [doneBtn setAction:@selector(done)];
}

-(void)done{

    self.imageArray = [[NSMutableArray alloc] init];
    for(NSIndexPath *indexPath in [self.collectionView indexPathsForSelectedItems]){
        
        ALAsset *resultAsset = self.assets[indexPath.row];
        ALAssetRepresentation* representation = [resultAsset defaultRepresentation];
        CGImageRef resultImageRef = [representation fullResolutionImage];
        UIImage *resultImage = [UIImage imageWithCGImage:resultImageRef];
        [representation fullResolutionImage];
        
        [self.imageArray addObject:resultImage];//获取高清图
    }
    NSLog(@"----%@",self.imageArray);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setAssetsGroup:(ALAssetsGroup *)assetsGroup{
    _assetsGroup = assetsGroup;
    [self reloadData];
}

- (void)reloadData
{
    // Reload assets
    [self.assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result) {
            [self.assets addObject:result];
            [self.collectionView reloadData];
        }
    }];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    for(NSIndexPath *index in [collectionView indexPathsForSelectedItems]){
        if(indexPath.row == index.row){
//            cell.alpha = 0.4;
            [cell selectState];
            break;
        }else{
//            cell.alpha = 1;
            [cell deselectState];

        }
    }
    
    [cell setData:[self.assets objectAtIndex:indexPath.row]];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


 //Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
   NSLog(@"--1---%@",[collectionView indexPathsForSelectedItems]);

    return ([collectionView indexPathsForSelectedItems].count < MAX_SELECT_COUNT);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell selectState];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell deselectState];
}


@end
