//
//  ARFBookApiClient.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARFBookApiClient : NSObject

+(void) requestBooksWithURL:(NSString *) stURL
                withSuccess:(void (^) (NSArray * books)) successBlock
                withFailure:(void (^)(NSString * error)) failureBlock;

+(void) donwloadDataWithURL:(NSString *) url
                withSuccess:(void(^)(NSData *data)) successBlock
                withFailure:(void(^)(NSString *error)) failureBlock
               withProgress:(void(^)(float progress)) progressBlock;

@end
