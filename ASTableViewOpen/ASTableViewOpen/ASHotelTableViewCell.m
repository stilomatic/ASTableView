//
//  ASHotelTableViewCell.m
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASHotelTableViewCell.h"
#import "UILabel+Style.h"

@implementation ASHotelTableViewCell
@synthesize item, randomColor, isOpen, delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.isOpen = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.randomColor = UIRandomColor;
        colorView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, 220)];
        colorView.backgroundColor = self.randomColor;
        colorView.autoresizingMask = UIViewAutoresizingNone;
        [self addSubview:colorView];
        
        self.autoresizesSubviews = NO;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.layer.masksToBounds = YES;
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.bounds.size.width-40, 20)];
        nameLabel.numberOfLines = 1;
        [nameLabel setStyle:[UIFont systemFontOfSize:14]];
        [self addSubview:nameLabel];
        
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nameLabel.frame), self.bounds.size.width-40, 60)];
        priceLabel.numberOfLines = 3;
        [priceLabel setStyle:[UIFont boldSystemFontOfSize:32]];
        [self addSubview:priceLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    colorView.frame = CGRectMake(0.0, 0.0, screenRect.size.height, 220);
    colorView.backgroundColor = self.randomColor;
    nameLabel.text = item.date;
    priceLabel.text = item.title;
}

-(void)addDescription
{
    
    if (self.isOpen) {
        descripionText = [[UITextView alloc] initWithFrame:CGRectMake(20,  CGRectGetMaxY(colorView.frame), self.bounds.size.width-40, self.bounds.size.height-285)];
        descripionText.backgroundColor = [UIColor clearColor];
        descripionText.font = [UIFont systemFontOfSize:12];
        descripionText.textColor = self.randomColor;
        descripionText.editable = NO;
        descripionText.allowsEditingTextAttributes = NO;
        descripionText.textAlignment = NSTextAlignmentJustified;
        descripionText.text = item.mdescription;
        descripionText.alpha = 0.0;
        [self addSubview:descripionText];

        [UIView animateWithDuration:0.4 animations:^{
            descripionText.alpha = 1.0;
            priceLabel.frame = CGRectMake(20, CGRectGetMaxY(nameLabel.frame),self.bounds.size.width-40, 180);
        }];
    }else{
        [descripionText removeFromSuperview];
        descripionText = nil;
        [UIView animateWithDuration:0.4 animations:^{
            priceLabel.frame = CGRectMake(20, CGRectGetMaxY(nameLabel.frame),self.bounds.size.width-40, 60);
        }];
    }

}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate) {
        [self.delegate displayCell:self];
    }
}

@end
