//
//  SCUserExtension.m
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCUserExtension.h"

@implementation SCUserExtension

+ (SCUserExtension *)sharedInstance
{
    static SCUserExtension *userExtension = nil;
    if (userExtension == nil)
    {
        userExtension = [[SCUserExtension alloc] init];
        [userExtension setAttributesFromLocale];
    }
    
    return userExtension;
}

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary;
{
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    [self setValuesForKeysWithDictionary:dictionary];
}

- (void)setAttributesFromLocale
{
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"USEREXTENSION"];
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    [self setValuesForKeysWithDictionary:dictionary];
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (self.clothingSize) {
        [dictionary setObject:@(self.clothingSize) forKey:@"clothingSize"];
    }
    if (self.shoeSize) {
        [dictionary setObject:@(self.shoeSize) forKey:@"shoeSize"];
    }
    if (self.hatSize) {
        [dictionary setObject:@(self.hatSize) forKey:@"hatSize"];
    }
    if (self.keyword) {
        [dictionary setObject:self.keyword forKey:@"keyword"];
    }
    if (self.color) {
        [dictionary setObject:self.color forKey:@"color"];
    }
    if (self.autoAddCart) {
        [dictionary setObject:@(self.autoAddCart) forKey:@"autoAddCart"];
    }
    if (self.completeCheckout) {
        [dictionary setObject:@(self.completeCheckout) forKey:@"completeCheckout"];
    }
    if (self.keywordFinder) {
        [dictionary setObject:@(self.keywordFinder) forKey:@"keywordFinder"];
    }
    if (self.strClothingSize) {
        [dictionary setObject:self.strClothingSize forKey:@"strClothingSize"];
    }
    if (self.strShoeSize) {
        [dictionary setObject:self.strShoeSize forKey:@"strShoeSize"];
    }
    if (self.strHatSize) {
        [dictionary setObject:self.strHatSize forKey:@"strHatSize"];
    }
    if (self.paymentDelaySecs) {
        [dictionary setObject:[NSString stringWithFormat:@"%f", self.paymentDelaySecs] forKey:@"paymentDelaySecs"];
    }
    return dictionary;
}

- (void)saveUserExtension
{
    NSDictionary *dictionary = [self dictionaryRepresentation];
    [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:@"USEREXTENSION"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
