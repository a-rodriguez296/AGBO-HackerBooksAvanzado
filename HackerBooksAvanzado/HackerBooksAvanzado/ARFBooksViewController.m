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
#import "ARFBooksViewController+Utils.h"
#import "ARFPredicates.h"
#import "ARFBookViewController.h"
#import "ARFConstants.h"
#import "ARFSearchResultsViewController.h"
#import "ARFBooksViewController+Notifications.h"
#import "ARFBooksViewController+SearchBar.h"
#import "ARFBooksViewController+SearchResults.h"
#import "ARFCoreDataUtils.h"

@interface ARFBooksViewController () 



@end

@implementation ARFBooksViewController  

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [self setTitle:@"Hacker Books"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class])  bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    //Select last Book
    //[self selectLastBook];
    
    //Create SearchBar
    [self createSearchBarController];
    
    
}





#pragma mark ARFBooksViewControllerDelegate
-(void)booksViewController:(ARFBooksViewController *)libraryVC didSelectBook:(ARFBook *)book{
    
    ARFBookViewController *bookVC = [[ARFBookViewController alloc] initWithBook:book];
    [self.navigationController pushViewController:bookVC animated:YES];
    
}


#pragma mark Utils
-(void) selectLastBook{
    
    //Selección de la última celda visitada
    NSInteger lastObjectRow = [[[NSUserDefaults standardUserDefaults] objectForKey:kObjectRow] integerValue];
    ARFTag *lastTag = [ARFTag retrieveLastSelectedTag];
    if (!lastTag) {
        lastTag = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForItem:kFirstRow inSection:kFirstSection]];
    }
    
    NSIndexPath *lastSelectedSection =[self.fetchedResultsController indexPathForObject:lastTag];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:lastObjectRow inSection:lastSelectedSection.section] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

-(void) createSearchBarController{
    
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

@end
