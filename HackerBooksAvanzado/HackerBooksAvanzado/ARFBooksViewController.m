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

static NSString * const cellIdentifier = @"Cell";
static const NSUInteger kFavoritesSection = 0;

@interface ARFBooksViewController ()

@end

@implementation ARFBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Hacker Books"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class])  bundle:nil] forCellReuseIdentifier:cellIdentifier];
}


#pragma mark TableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFBook *book;
    
    if (indexPath.section == kFavoritesSection) {
        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title ascending:YES withPredicate:[ARFPredicates favoriteBooksPredicate]] objectAtIndex:indexPath.row];
    }
    else{
        
        //Encontrar el tag actual
        //Pregunta
        //Esta es la mejor manera de acceder a los objetos?????????????
        ARFTag * currentTag = [self getTagWithSection:indexPath.section fetchedResultsController:self.fetchedResultsController];
        
        
        //Encontrar el libro actual
        book = [[ARFBook MR_findAllSortedBy:ARFBookAttributes.title
                                  ascending:YES
                              withPredicate:[ARFPredicates booksPredicateWithTag:currentTag]]
                objectAtIndex:indexPath.row];
        
    }
    
    //Crear la celda
    ARFBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //Llenar la celda
    [cell.lblTitle setText:book.title];
    
    //Devolver la celda
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == kFavoritesSection) {
        return [ARFBook MR_countOfEntitiesWithPredicate:[ARFPredicates favoriteBooksPredicate]];
    }
    else{
        //Pregunta
        //Esta es la mejor manera de acceder a los objetos?????????????
        ARFTag * currentTag = [self getTagWithSection:section fetchedResultsController:self.fetchedResultsController];
        return [ARFBook MR_countOfEntitiesWithPredicate:[ARFPredicates booksPredicateWithTag:currentTag]];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [super numberOfSectionsInTableView:tableView] +1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == kFavoritesSection) {
        return @"Favorites";
    }
    else{
        ARFTag * currentTag = [self getTagWithSection:section fetchedResultsController:self.fetchedResultsController];
        return currentTag.tagName;
    }
}




@end
