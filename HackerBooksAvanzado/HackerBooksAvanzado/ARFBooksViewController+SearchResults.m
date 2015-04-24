//
//  ARFBooksViewController+SearchResults.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/15/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+SearchResults.h"


@implementation ARFBooksViewController (SearchResults)

-(void)searchController:(ARFSearchResultsViewController *)searchController didSelectItem:(id)item{
    
    [self.delegate booksViewController:self didSelectBook:item];
}

@end
