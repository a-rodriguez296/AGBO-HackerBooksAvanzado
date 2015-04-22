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
#import "ARFConstants.h"
#import "ARFBookTags.h"
#import "ARFbook.h"
#import "ARFTag.h"

@implementation ARFBooksViewController (TableView)

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFBookTags *bookTag = [self.fetchedResultsController fetchedObjects][indexPath.section];
    
    ARFTag *tag = [self.fetchedResultsController fetchedObjects][indexPath.section];
    ARFBook *book = [[tag books] allObjects][indexPath.row];
    
    //Crear la celda
    ARFBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //Llenar la celda
    [cell.lblTitle setText:book.title];
    [cell.lblAuthor setText:[ARFBook authorsWithBook:book]];
    
    //Devolver la celda
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    ARFTag *currentTag = [self.fetchedResultsController fetchedObjects][section];
    NSLog(@"%@",currentTag.tagName);
    return currentTag.books.count;
}

-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    ARFBookTags * booksTags = [self.fetchedResultsController objectAtIndexPath:indexPath];
    ARFTag *tag = [self.fetchedResultsController fetchedObjects][indexPath.section];
    ARFBook *book = [tag.books allObjects][indexPath.row];
    
    //Guardar item selecionado
//    [[NSUserDefaults standardUserDefaults] setValue:[ARFBookTags createDataWithBookTag:booksTags] forKey:kObjectID];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.delegate booksViewController:self didSelectBook:book];
}


@end
