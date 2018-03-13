//
//  SCWebService.h
//  SuperCop
//
//  Created by Venus on 9/23/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SCWebServiceCompletionHandler)(NSError *error, id result);

@interface SCWebService : NSObject

+ (SCWebService*)sharedInstance;

- (void)loginWithUsername:(NSString*)userEmail
                 password:(NSString*)password
                     uuid:(NSString*)uuid
               completion:(SCWebServiceCompletionHandler)completionHandler;
- (void) getJsonList:(NSString*)filename
          completion:(SCWebServiceCompletionHandler)completionHandler;

@end
