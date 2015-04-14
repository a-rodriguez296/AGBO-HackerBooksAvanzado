//
//  ARFBooksViewController+Utils.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController.h"
@class ARFTag;

@interface ARFBooksViewController (Utils)

-(ARFTag *) getTagWithSection:(NSUInteger)section fetchedResultsController:(NSFetchedResultsController *) results;

@end
