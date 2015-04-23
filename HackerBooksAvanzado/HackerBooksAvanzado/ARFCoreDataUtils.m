//
//  ARFCoreDataContext.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/23/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFCoreDataUtils.h"
#import "AppDelegate.h"
#import "AGTCoreDataStack.h"


@implementation ARFCoreDataUtils

+(NSManagedObjectContext *) defaultContext{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.model.context;
}

+(AGTCoreDataStack *) model{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.model;
}

@end
