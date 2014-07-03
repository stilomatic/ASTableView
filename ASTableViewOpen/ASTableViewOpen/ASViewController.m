//
//  ASViewController.m
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASViewController.h"
#import "ASFeedManager.h"
#import "ASHotelTableViewCell.h"


#define kTableCloseHeight 100.0
static NSString *cellIdentifier = @"hotelsCells";

@interface ASViewController ()


@end

@implementation ASViewController

#pragma mark UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return hotelsList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableCloseHeight;
}

-(UITableViewCell*)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ASHotelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [(ASHotelTableViewCell*)cell setItem:[hotelsList objectAtIndex:indexPath.row]];
    [(ASHotelTableViewCell*)cell setDelegate:self];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    return cell;

}

-(void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

}

-(void)displayCell:(ASHotelTableViewCell*)cell
{
    if (!cell.isOpen) {
    
        ASHotelTableViewCell *newCell = [[ASHotelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        newCell.item = cell.item;
        newCell.randomColor = cell.randomColor;
        newCell.isOpen = YES;
        newCell.delegate = self;
        [newCell setNeedsLayout];
        [newCell layoutIfNeeded];
        currentFrame = CGRectMake(0.0, cell.frame.origin.y - tableView.contentOffset.y, self.view.bounds.size.width, kTableCloseHeight);
        newCell.frame = currentFrame;
        [self.view addSubview:newCell];
        
        [UIView animateWithDuration:0.4 animations:^{
            tableView.alpha = 0.0;
            newCell.frame = self.view.bounds;
        } completion:^(BOOL finished) {
            [newCell addDescription];
        }];
    }else{
        cell.isOpen = NO;
        [cell addDescription];
        [UIView animateWithDuration:0.4 animations:^{
            tableView.alpha = 1.0;
            cell.frame = currentFrame;
        } completion:^(BOOL finished) {
            [cell removeFromSuperview];
        }];
    }
}

#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    tableView.backgroundColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.alpha = 0.0;
    
	ASFeedManager *cacheManager = [ASFeedManager sharedInstance];
    [cacheManager loadItems:^(NSArray *data) {
       // NSLog(@"Hotels %@",data);
        hotelsList = data;
        [tableView reloadData];
        [UIView animateWithDuration:0.4 animations:^{
            tableView.alpha = 1.0;
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
