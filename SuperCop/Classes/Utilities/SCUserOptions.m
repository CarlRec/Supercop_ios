//
//  SCUserOptions.m
//  SuperCop
//
//  Created by Venus on 9/4/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCUserOptions.h"

@implementation SCUserOptions

+ (SCUserOptions *)sharedInstance
{
    static SCUserOptions *userOptions = nil;
    if (userOptions == nil)
    {
        userOptions = [[SCUserOptions alloc] init];
        [userOptions setAttributesFromLocale];
    }
    
    return userOptions;
}

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    [self setValuesForKeysWithDictionary:dictionary];
}

- (void)setAttributesFromLocale
{
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"USEROPTIONS"];
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    [self setValuesForKeysWithDictionary:dictionary];
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    if (self.email) {
        [dictionary setObject:self.email forKey:@"email"];
    }
    if (self.telephone) {
        [dictionary setObject:self.telephone forKey:@"telephone"];
    }
    if (self.address1) {
        [dictionary setObject:self.address1 forKey:@"address1"];
    }
    if (self.address2) {
        [dictionary setObject:self.address2 forKey:@"address2"];
    }
    if (self.address3) {
        [dictionary setObject:self.address3 forKey:@"address3"];
    }
    if (self.zipcode) {
        [dictionary setObject:self.zipcode forKey:@"zipcode"];
    }
    if (self.city) {
        [dictionary setObject:self.city forKey:@"city"];
    }
    if (self.state) {
        [dictionary setObject:self.state forKey:@"state"];
    }
    if (self.country) {
        [dictionary setObject:self.country forKey:@"country"];
    }
    if (self.card) {
        [dictionary setObject:self.card forKey:@"card"];
    }
    if (self.cardnumber) {
        [dictionary setObject:self.cardnumber forKey:@"cardnumber"];
    }
    if (self.cvv) {
        [dictionary setObject:self.cvv forKey:@"cvv"];
    }
    if (self.month) {
        [dictionary setObject:self.month forKey:@"month"];
    }
    if (self.year) {
        [dictionary setObject:self.year forKey:@"year"];
    }
    return dictionary;
}

- (void)saveUserOptions
{
    NSDictionary *dictionary = [self dictionaryRepresentation];
    [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:@"USEROPTIONS"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
