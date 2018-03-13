//
//  SCCustomButton.m
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCCustomButton.h"

@implementation SCCustomButton

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
    CGRect frame = self.titleLabel.frame;
    frame.origin.x -= 2;
    frame.size.width += 4;
    self.titleLabel.frame = frame;
    self.titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
    if (self.titleLabel.font.pointSize >= 20)
        self.titleLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:self.titleLabel.font.pointSize];
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
    self.titleLabel.clipsToBounds = NO;
    
    [self setNeedsLayout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
