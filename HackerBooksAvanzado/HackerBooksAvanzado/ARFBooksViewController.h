//
//  ARFBooksViewController.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

@import UIKit;

#import "ARFBaseFetchedResultsController.h"
@class ARFBook;

static NSString * const cellIdentifier = @"Cell";
static const NSUInteger kFavoritesSection = 0;

@class ARFBooksViewController;

@protocol ARFBooksViewControllerDelegate <NSObject>

@required
-(void) booksViewController:(ARFBooksViewController *) libraryVC didSelectBook:(ARFBook *) book;

@end


@interface ARFBooksViewController : ARFBaseFetchedResultsController <ARFBooksViewControllerDelegate>

@property(nonatomic, weak) id<ARFBooksViewControllerDelegate> delegate;




@end
