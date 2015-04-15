//
//  ARFBooksViewController+TableView.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/14/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+TableView.h"
#import "ARFBook.h"
#import "CoreData+MagicalRecord.h"
#import "ARFPredicates.h"
#import "ARFBooksViewController+Utils.h"
#import "ARFBookCell.h"
#import "ARFTag.h"
#import "ARFConstants.h"
#import "ARFBookTags.h"

@implementation ARFBooksViewController (TableView)

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFBookTags *bookTag = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
//    if (indexPath.section == kFavoritesSection) {
//        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title ascending:YES withPredicate:[ARFPredicates favoriteBooksPredicate]] objectAtIndex:indexPath.row];
//    }
//    else{
//        
//        //Encontrar el tag actual
//        //Pregunta
//        //Esta es la mejor manera de acceder a los objetos?????????????
//        ARFTag * currentTag = [self getTagWithSection:indexPath.section];
//        
//        
//        //Encontrar el libro actual
//        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title
//                                  ascending:YES
//                              withPredicate:[ARFPredicates booksPredicateWithTag:currentTag]]
//                objectAtIndex:indexPath.row];
//        
//    }
    
    //Crear la celda
    ARFBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //Llenar la celda
    [cell.lblTitle setText:bookTag.book.title];
//    [cell.lblAuthor setText:[ARFBook authorsWithBook:book]];
    
    //Devolver la celda
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    if (section == kFavoritesSection) {
//        return [ARFBook MR_countOfEntitiesWithPredicate:[ARFPredicates favoriteBooksPredicate]];
//    }
//    else{
//        //Pregunta
//        //Esta es la mejor manera de acceder a los objetos?????????????
//        ARFTag * currentTag = [self getTagWithSection:section ];
//        return [ARFBook MR_countOfEntitiesWithPredicate:[ARFPredicates booksPredicateWithTag:currentTag]];
//    }
//    
//}

-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ARFBook *book;
    
//    if (indexPath.section == kFavoritesSection) {
//        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title ascending:YES withPredicate:[ARFPredicates favoriteBooksPredicate]] objectAtIndex:indexPath.row];
//    }
//    else{
//        
//        //Encontrar el tag actual
//        ARFTag * currentTag = [self getTagWithSection:indexPath.section];
//        
//        //Encontrar el libro actual
//        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title
//                                  ascending:YES
//                              withPredicate:[ARFPredicates booksPredicateWithTag:currentTag]]
//                objectAtIndex:indexPath.row];
//        
//        [[NSUserDefaults standardUserDefaults] setValue:[ARFTag createDataWithTag:currentTag] forKey:kObjectID];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }

    ARFBookTags * booksTags = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self.delegate booksViewController:self didSelectBook:booksTags.book];
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//        return 2;
//}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    if (section == kFavoritesSection) {
//        return @"Favorites";
//    }
//    else{
//        ARFTag * currentTag = [self getTagWithSection:section];
//        return currentTag.tagName;
//    }
//}


@end
