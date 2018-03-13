//
//  SCUserExtension.h
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCUserExtension : NSObject

@property (nonatomic, assign) NSInteger clothingSize;
@property (nonatomic, assign) NSInteger shoeSize;
@property (nonatomic, assign) NSInteger hatSize;
@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, assign) BOOL autoAddCart;
@property (nonatomic, assign) BOOL completeCheckout;
@property (nonatomic, assign) BOOL keywordFinder;
@property (nonatomic, strong) NSString *strClothingSize;
@property (nonatomic, strong) NSString *strShoeSize;
@property (nonatomic, strong) NSString *strHatSize;
@property (nonatomic, assign) float paymentDelaySecs;

+ (SCUserExtension *)sharedInstance;

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary;

- (void)setAttributesFromLocale;

- (NSDictionary *)dictionaryRepresentation;

- (void)saveUserExtension;

@end
