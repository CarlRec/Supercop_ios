//
//  SCWebService.m
//  SuperCop
//
//  Created by Venus on 9/23/14.
//  Copyright (c) 2014 SuperCop. All rights reserved.
//

#import "SCWebService.h"
#import "AFNetworking.h"

#define SCWEB_BASEURL            @"https://supercopbot.com"
#define SCWEB_EXTRA_BASEURL      @"http://www.supremenewyork.com"

@interface SCWebService ()
{
    AFHTTPRequestOperationManager *httpRequestOperationManager;
    AFHTTPRequestOperationManager *httpRequestExtraManager;
    
    NSString *authTokenKey;
}

@end

@implementation SCWebService

+ (SCWebService*)sharedInstance
{
    static SCWebService *_sharedInstance;
    if (_sharedInstance == nil)
        _sharedInstance = [[SCWebService alloc] init];
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        httpRequestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:SCWEB_BASEURL]];
        httpRequestOperationManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [httpRequestOperationManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        httpRequestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:httpRequestOperationManager.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObject:@"text/html"];
        httpRequestOperationManager.responseSerializer.acceptableContentTypes = acceptableContentTypes;

        httpRequestExtraManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:SCWEB_EXTRA_BASEURL]];
        httpRequestExtraManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [httpRequestExtraManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        httpRequestExtraManager.responseSerializer = [AFJSONResponseSerializer serializer];
        httpRequestExtraManager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    }
    
    return self;
}


- (void) getJsonList:(NSString*)filename
             completion:(SCWebServiceCompletionHandler)completionHandler
{
    
    [httpRequestExtraManager GET:filename parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary * response = responseObject;
            NSLog(@"%@", response);
            if (completionHandler != nil)
                completionHandler(nil, response);
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", error.description);
            if (completionHandler != nil)
                completionHandler(error, nil);
        });
    }];
}

- (void)loginWithUsername:(NSString*)userEmail
                 password:(NSString*)password
                    uuid:(NSString*)uuid
               completion:(SCWebServiceCompletionHandler)completionHandler
{
    //{"group":"[string]","username":"[string]","password":"[string]","clientid":[int]}
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@"login", @"action", userEmail, @"useremail", password, @"pswd", uuid, @"uuid", nil];
    [httpRequestOperationManager GET:@"/ios/auth/index.php" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary * response = responseObject;
            NSLog(@"%@", response);
            if (completionHandler != nil)
                completionHandler(nil, response);
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", error.description);
            if (completionHandler != nil)
                completionHandler(error, nil);
        });
    }];
}

@end
