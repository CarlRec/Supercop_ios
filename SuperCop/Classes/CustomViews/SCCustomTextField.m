//
//  SCCustomTextField.m
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCCustomTextField.h"

@implementation SCCustomTextField

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
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
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
