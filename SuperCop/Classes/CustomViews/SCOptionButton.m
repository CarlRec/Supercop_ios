//
//  SCOptionButton.m
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCOptionButton.h"

@implementation SCOptionButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected == YES)
    {
        [self setBackgroundImage:[UIImage imageNamed:@"red_button"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.borderWidth = 0.0f;
    }
    else
    {
        [self setBackgroundImage:[UIImage imageNamed:@"black_button"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.layer.borderWidth = 1.0f;
    }
}

@end
