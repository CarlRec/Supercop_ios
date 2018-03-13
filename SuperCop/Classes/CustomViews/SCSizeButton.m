//
//  SCSizeButton.m
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCSizeButton.h"

@interface SCSizeButton ()
{
    UILabel *sizeLabel;
}

@end

@implementation SCSizeButton

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
    self.layer.cornerRadius = 1.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    if (sizeLabel == nil)
    {
        sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 2.0f / 3.0f, 3, self.frame.size.width * 2.0f / 3.0f, self.frame.size.height)];
        sizeLabel.font = [UIFont fontWithName:@"Futura-HeavyOblique" size:16];
        sizeLabel.textColor = [UIColor redColor];
        sizeLabel.text = @"LARGE";
        [self addSubview:sizeLabel];
    }
}

- (void)setSizeString:(NSString *)sizeString
{
    _sizeString = sizeString;
    sizeLabel.text = sizeString;
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
