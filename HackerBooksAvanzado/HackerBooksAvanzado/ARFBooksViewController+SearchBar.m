//
//  ARFBooksViewController+SearchBar.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/15/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+SearchBar.h"
#import "ARFSearchResultsViewController.h"
#import "ARFBook.h"
#import "ARFAuthor.h"
#import "ARFTag.h"
#import "ARFCoreDataUtils.h"

@implementation ARFBooksViewController (SearchBar) 

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    // update the filtered array based on the search text
    NSString *searchText = searchController.searchBar.text;
    
    //Buscar libros por título
    NSPredicate *titlePredicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@",ARFBookAttributes.title,searchText];
    
    //Buscar libros por autor
    NSPredicate *authorsBookPredicate = [NSPredicate predicateWithFormat:@"%K.%K contains[cd] %@",ARFBookRelationships.authors,ARFAuthorAttributes.name,searchText];

    
    //Buscar libros por tag
    NSPredicate *authorsTagPredicate = [NSPredicate predicateWithFormat:@"%K.%K contains[cd] %@",ARFBookRelationships.tags,ARFTagAttributes.tagName, searchText];
    NSPredicate *completePredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[titlePredicate,authorsBookPredicate,authorsTagPredicate]];
    
    
    
    
    //Crear un arreglo nuevo con los resultados
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFBook entityName]];
    [req setPredicate:completePredicate];
    NSArray *searchResults = [[ARFCoreDataUtils defaultContext] executeFetchRequest:req error:nil];
    
    
    // hand over the filtered results to our search results table
    ARFSearchResultsViewController *tableController = (ARFSearchResultsViewController *)self.searchController.searchResultsController;
    tableController.filteredBooks = searchResults;
    [tableController.tableView reloadData];
    
    
    
}


@end
