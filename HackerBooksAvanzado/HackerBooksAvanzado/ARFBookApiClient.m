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
                withSuccess:(void (^) (void)) successBlock
                withFailure:(void (^)(NSString * error)) failureBlock{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:stURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *errorJson;
        
        
        NSArray* objectsArray = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&errorJson];
        
        for (NSDictionary *bookDictionary in objectsArray) {
            ARFBookParser *bookParser = [ARFBookParser new];
            [bookParser parseBookWithData:bookDictionary];
            [ARFBook createBookWithTitle:bookParser.title tags:bookParser.tagsList authors:bookParser.authorsList aPhotoURL:bookParser.urlImage aPDFURL:bookParser.urlPDF];
            
        }
        
        NSLog(@"%@",[NSManagedObjectContext MR_defaultContext]);
        
        //Grabar datos en core data
        [MagicalRecord saveUsingCurrentThreadContextWithBlock:nil completion:^(BOOL success, NSError *error) {
            NSLog(@"Guardo los datos correctamente");
            successBlock();
        }];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+(void) donwloadDataWithURL:(NSString *) url
                withSuccess:(void(^)(NSData *data)) successBlock
                withFailure:(void(^)(NSString *error)) failureBlock
               withProgress:(void(^)(float progress)) progressBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFHTTPRequestOperation *operation = [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = (NSData *) responseObject;
        successBlock(data);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock([NSString stringWithFormat:@"Error: %@",error]);
    }];
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        float progress =(float) totalBytesRead/totalBytesExpectedToRead;
        progressBlock(progress);
    }];
}


@end
