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



@interface ARFBooksViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) ARFSearchResultsViewController * resultsTableController;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ARFBooksViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Hacker Books"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class])  bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    
    //Selección de la última celda visitada
//    NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
//    ARFTag *lastTag = [ARFTag objectWithArchivedURIRepresentation:lastObjectData context:[NSManagedObjectContext MR_defaultContext]];
//    if (lastTag) {
//        NSIndexPath *lastSelectedIndexPath =[self.fetchedResultsController indexPathForObject:lastTag];
//        [self.tableView selectRowAtIndexPath:lastSelectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//    }
    
    //Suscripción a notificaciones
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeBookModel:) name:kDidChangeBookNotification object:nil];
    
    //Creación del search results controller
    _resultsTableController = [[ARFSearchResultsViewController alloc] init];
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


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    // update the filtered array based on the search text
    NSString *searchText = searchController.searchBar.text;
    
    //Crear un arreglo nuevo con los resultados
    NSArray *searchResults = [NSArray new];
    
    
    // hand over the filtered results to our search results table
    ARFSearchResultsViewController *tableController = (ARFSearchResultsViewController *)self.searchController.searchResultsController;
    tableController.filteredBooks = searchResults;
    [tableController.tableView reloadData];
    
    
    
}



#pragma mark - UISearchControllerDelegate

// Called after the search controller's search bar has agreed to begin editing or when
// 'active' is set to YES.
// If you choose not to present the controller yourself or do not implement this method,
// a default presentation is performed on your behalf.
//
// Implement this method if the default presentation is not adequate for your purposes.
//
- (void)presentSearchController:(UISearchController *)searchController {
    
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    // do something before the search controller is presented
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    // do something after the search controller is presented
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    // do something before the search controller is dismissed
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    // do something after the search controller is dismissed
}


@end
