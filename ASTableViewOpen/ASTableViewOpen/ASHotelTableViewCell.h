//
//  ASHotelTableViewCell.h
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASHotelTableViewCellDelegate.h"
#import "FeedItem.h"

#define UIRandomColor [UIColor colorWithRed:(float)(arc4random()%122 /255.0)+0.5 green:(float)(arc4random()%122 /255.0)+0.5 blue:(float)(arc4random()%122 /255.0)+0.5 alpha:1.0]

@interface ASHotelTableViewCell : UITableViewCell
{
    UIView *colorView;
    UILabel *nameLabel;
    UILabel *priceLabel;
    UITextView *descripionText;

}

@property (nonatomic,weak) id<ASHotelTableViewCellDelegate> delegate;
@property (nonatomic) BOOL isOpen;
@property (nonatomic,strong) UIColor *randomColor;
@property (nonatomic,strong) FeedItem *item;

-(void)addDescription;

@end
