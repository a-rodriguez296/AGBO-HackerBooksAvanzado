//
//  ARFBooksViewController+Utils.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+Utils.h"
#import "ARFTag.h"


@implementation ARFBooksViewController (Utils)


-(ARFTag *) getTagWithSection:(NSUInteger)section{
    return [[self.fetchedResultsController fetchedObjects] objectAtIndex:section-1];
}



@end
