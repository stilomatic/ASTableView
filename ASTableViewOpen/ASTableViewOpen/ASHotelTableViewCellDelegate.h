//
//  ASHotelTableViewCellDelegate.h
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASHotelTableViewCell;

@protocol ASHotelTableViewCellDelegate <NSObject>

-(void)displayCell:(ASHotelTableViewCell*)cell;

@end
