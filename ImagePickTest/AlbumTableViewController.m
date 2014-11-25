//
//  AlbumTableViewController.m
//  ImagePickTest
//
//  Created by 陈鲲鹏 on 14/11/17.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "AlbumTableViewCell.h"
#import "PhotoCollectionViewController.h"

@interface AlbumTableViewController ()

@end

@implementation AlbumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的相册";

    self.assetsLibrary = [[ALAssetsLibrary alloc] init];
    self.assetsGroups = [NSMutableArray new];
    
    void (^assetsGroupsEnumerationBlock)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *assetsGroup, BOOL *stop) {
        if(assetsGroup) {
            [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];

            if(assetsGroup.numberOfAssets > 0) {
                NSLog(@"assetsGroup--->>%@",assetsGroup);
                [self.assetsGroups addObject:assetsGroup];
                [self.tableView reloadData];
            }
        }
    };
    
    void (^assetsGroupsFailureBlock)(NSError *) = ^(NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    };
    
    // Enumerate Camera roll first
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    NSUInteger type =
    ALAssetsGroupLibrary | ALAssetsGroupAlbum | ALAssetsGroupEvent |
    ALAssetsGroupFaces | ALAssetsGroupPhotoStream;

    // Then all other groups
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    [self.assetsLibrary enumerateGroupsWithTypes:type
                                      usingBlock:assetsGroupsEnumerationBlock
                                    failureBlock:assetsGroupsFailureBlock];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.assetsGroups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AlbumTableViewCell";//AlbumTableViewCell

    AlbumTableViewCell *cell = (AlbumTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = //[[AlbumTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AlbumTableViewCell"];
        [[[NSBundle mainBundle] loadNibNamed:@"AlbumTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    [cell initData:self.assetsGroups[indexPath.row]];
    
    return cell;
}

#pragma mark Table Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

//- (NSIndexPath *)tableView:(UITableView *)tableView
//  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"---willselect:%ld",(long)indexPath.row);
//    return indexPath;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewController *v = [[PhotoCollectionViewController alloc] init];
    v.assetsGroup = [self.assetsGroups objectAtIndex:indexPath.row];
    NSLog(@"V.assetsGroup:%@",v.assetsGroup);
    [self.navigationController  pushViewController:v animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
