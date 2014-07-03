//
//  ASViewController.h
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASHotelTableViewCellDelegate.h"

@interface ASViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ASHotelTableViewCellDelegate>
{
    IBOutlet UITableView *tableView;
    NSArray *hotelsList;
    CGRect currentFrame;
}

@end
