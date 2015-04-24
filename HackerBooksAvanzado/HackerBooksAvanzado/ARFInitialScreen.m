//
//  ARFInitialScreen.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/23/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFInitialScreen.h"
#import "ARFBooksViewController.h"
#import "ARFBookViewController.h"
#import "ARFTag.h"
#import "ARFBook.h"
#import "ARFConstants.h"

@implementation ARFInitialScreen


+(UIViewController *) createInitialViewController{
    
    ARFBooksViewController *booksVC = [[ARFBooksViewController alloc] initWithFetchedResultsController:[ARFTag createFRCForTable]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        //Selección de la última celda visitada
        ARFTag *lastTag = [ARFTag retrieveLastSelectedTag];
        
        ARFBook *lastBook;
        
        //Determinar si hay un ultimo libro
        
        if (lastTag) {
            
            NSInteger lastObjectRow = [[[NSUserDefaults standardUserDefaults] objectForKey:kObjectRow] integerValue];
            lastBook = [[lastTag books] allObjects][lastObjectRow];
        }
        else{
            
            //Caso primera vez
            ARFTag *firstElement = [booksVC.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:kFirstSection inSection:kFirstRow]];
            lastBook = [firstElement.books allObjects][kFirstRow];
        }
        
        
        //Crear BookVC
        ARFBookViewController *bookVC = [[ARFBookViewController alloc] initWithBook:lastBook];
        [booksVC setDelegate:bookVC];
        
        //Empaquetar bookVC
        UINavigationController *navVC1  = [[UINavigationController alloc] initWithRootViewController:booksVC];
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:bookVC];
        
        //Crear SplitView
        UISplitViewController *splitVC = [UISplitViewController new];
        [splitVC setDelegate:bookVC];
        [splitVC setViewControllers:@[navVC1,navVC]];
        
        return splitVC;
    }
    else{
        [booksVC setDelegate:booksVC];
        return [[UINavigationController alloc ] initWithRootViewController:booksVC];
    }
}

@end
