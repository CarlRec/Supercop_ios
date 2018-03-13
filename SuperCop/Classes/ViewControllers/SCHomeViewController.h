//
//  SCHomeViewController.h
//  SuperCop
//
//  Created by Venus on 9/3/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCHomeViewControllerDelegate;

@interface SCHomeViewController : UIViewController

@property (nonatomic, strong) id <SCHomeViewControllerDelegate> delegate;
@property (nonatomic) BOOL purchaseDone;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSString *currentUrl;

@end

@protocol SCHomeViewControllerDelegate <NSObject>

- (void)didChangeKeywordFinder;

@end