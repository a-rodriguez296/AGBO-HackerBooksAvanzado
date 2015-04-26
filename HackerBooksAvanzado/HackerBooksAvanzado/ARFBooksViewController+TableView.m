//
//  ARFBooksViewController+TableView.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/14/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+TableView.h"
#import "ARFBook.h"
#import "ARFPredicates.h"
#import "ARFBooksViewController+Utils.h"
#import "ARFBookCell.h"
#import "ARFConstants.h"
#import "ARFBook.h"
#import "ARFTag.h"
#import "ARFCoreDataUtils.h"


@implementation ARFBooksViewController (TableView)

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ARFTag *tag = [self.fetchedResultsController fetchedObjects][indexPath.section];
    ARFBook *book = [[tag books] allObjects][indexPath.row];
    
    //Crear la celda
    ARFBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //Llenar la celda
    [cell.lblTitle setText:book.title];
    [cell.lblAuthor setText:[book normalizedAuthors]];
    
    //Devolver la celda
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    ARFTag *currentTag = [self.fetchedResultsController fetchedObjects][section];
    return currentTag.books.count;
}

-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ARFTag *tag = [self.fetchedResultsController fetchedObjects][indexPath.section];
    ARFBook *book = [tag.books allObjects][indexPath.row];
    
    //Guardar item selecionado
    [[NSUserDefaults standardUserDefaults] setValue:[ARFCoreDataUtils createDataWithEntity:tag] forKey:kObjectID];
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithUnsignedInteger:indexPath.row] forKey:kObjectRow];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.delegate booksViewController:self didSelectBook:book];
    
    //Se envía la notificación indicando que se cambio de libro
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidSelectBookNotification object:book];
}


@end
