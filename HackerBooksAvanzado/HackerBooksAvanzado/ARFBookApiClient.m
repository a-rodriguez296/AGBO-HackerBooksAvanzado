//
//  ARFBookApiClient.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBookApiClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "ARFBookParser.h"
#import "ARFBook.h"
#import "CoreData+MagicalRecord.h"
@implementation ARFBookApiClient


+(void) requestBooksWithURL:(NSString *) stURL
                withSuccess:(void (^) (NSArray * books)) successBlock
                withFailure:(void (^)(NSString * error)) failureBlock{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:stURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray * responseArray = [NSMutableArray new];
        NSError *errorJson;
        
        
        NSArray* objectsArray = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&errorJson];
        
        for (NSDictionary *bookDictionary in objectsArray) {
            ARFBookParser *bookParser = [ARFBookParser new];
            [bookParser parseBookWithData:bookDictionary];
            [ARFBook createBookWithTitle:bookParser.title tags:bookParser.tagsList authors:bookParser.authorsList aPhotoURL:bookParser.urlImage aPDFURL:bookParser.urlPDF];
            
        }
        //Grabar datos en core data
        [MagicalRecord saveUsingCurrentThreadContextWithBlock:nil completion:^(BOOL success, NSError *error) {
            
        }];

//        successBlock([NSArray arrayWithArray:responseArray]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
