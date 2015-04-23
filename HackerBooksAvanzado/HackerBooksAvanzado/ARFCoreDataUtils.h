//
//  ARFCoreDataContext.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/23/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;
@class AGTCoreDataStack;

@interface ARFCoreDataUtils : NSObject

+(NSManagedObjectContext *) defaultContext;
+(AGTCoreDataStack *) model;

@end
