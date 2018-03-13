//
//  SCUserOptions.h
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCUserOptions : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *address1;
@property (nonatomic, strong) NSString *address2;
@property (nonatomic, strong) NSString *address3;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *card;
@property (nonatomic, strong) NSString *cardnumber;
@property (nonatomic, strong) NSString *cvv;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *year;

+ (SCUserOptions *)sharedInstance;

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary;

- (void)setAttributesFromLocale;

- (NSDictionary *)dictionaryRepresentation;

- (void)saveUserOptions;

@end
