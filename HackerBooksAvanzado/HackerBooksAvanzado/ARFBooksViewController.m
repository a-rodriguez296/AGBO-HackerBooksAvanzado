//
//  ARFBooksViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController.h"
#import "ARFBookCell.h"
#import "ARFBook.h"
#import "ARFTag.h"
#import "CoreData+MagicalRecord.h"
#import "ARFBooksViewController+Utils.h"
#import "ARFPredicates.h"
#import "ARFBookViewController.h"
#import "ARFConstants.h"
#import "ARFSearchResultsViewController.h"
#import "ARFBooksViewController+Notifications.h"
#import "ARFBooksViewController+SearchBar.h"
#import "ARFBooksViewController+SearchResults.h"
#import "ARFBookTags.h"


@interface ARFBooksViewController () 



@end

@implementation ARFBooksViewController  

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [self setTitle:@"Hacker Books"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class])  bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    
    //Selección de la última celda visitada
    NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
    ARFBookTags *lastItem = [ARFBookTags objectWithArchivedURIRepresentation:lastObjectData context:[NSManagedObjectContext MR_defaultContext]];
    if (!lastItem) {
        ARFBookTags *firstElement = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        lastItem = firstElement;
    }
    
    NSIndexPath *lastSelectedIndexPath =[self.fetchedResultsController indexPathForObject:lastItem];
    [self.tableView selectRowAtIndexPath:lastSelectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
    
    //Creación del search results controller
    _resultsTableController = [[ARFSearchResultsViewController alloc] init];
    [self.resultsTableController setDelegate:self];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.searchController.searchBar.delegate = self;
    
    
}






-(void)booksViewController:(ARFBooksViewController *)libraryVC didSelectBook:(ARFBook *)book{
    
    ARFBookViewController *bookVC = [[ARFBookViewController alloc] initWithBook:book];
    [self.navigationController pushViewController:bookVC animated:YES];
    
}





@end
