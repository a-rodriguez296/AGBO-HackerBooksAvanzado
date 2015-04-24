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

@implementation ARFBooksViewController (SearchBar) 

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    // update the filtered array based on the search text
//    NSString *searchText = searchController.searchBar.text;
//    
//    //Buscar libros por título
//    NSPredicate *titlePredicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@",ARFBookAttributes.title,searchText];
//    
//    //Buscar libros por autor
//    NSPredicate *authorsBookPredicate = [NSPredicate predicateWithFormat:@"%K.name contains[cd] %@",ARFBookRelationships.authors,searchText];
//
//    
//    //Buscar libros por tag
//    NSPredicate *authorsTagPredicate = [NSPredicate predicateWithFormat:@"%K.%K.%K contains[cd] %@",ARFBookRelationships.bookTags,ARFBookTagsRelationships.tag,ARFTagAttributes.tagName, searchText];
//    NSPredicate *completePredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[titlePredicate,authorsBookPredicate,authorsTagPredicate]];
//    
//    
//    
//    
//    //Crear un arreglo nuevo con los resultados
//    NSArray *searchResults = [ARFBook MR_findAllWithPredicate:completePredicate];
//    
//    
//    // hand over the filtered results to our search results table
//    ARFSearchResultsViewController *tableController = (ARFSearchResultsViewController *)self.searchController.searchResultsController;
//    tableController.filteredBooks = searchResults;
//    [tableController.tableView reloadData];
    
    
    
}


@end
