//
//  ARFSplashViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/15/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFSplashViewController.h"
#import "ARFBookApiClient.h"
#import "ARFConstants.h"
#import "ARFBooksViewController.h"
#import "ARFBookTags.h"
#import "CoreData+MagicalRecord.h"
#import "ARFTag.h"
#import "ARFBookViewController.h"

@interface ARFSplashViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ARFSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _ME_WEAK
    
    //Descargar el Json
    [ARFBookApiClient requestBooksWithURL:kBooksUrl withSuccess:^{
        
        [me initializeControllers];
        
    } withFailure:^(NSString *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initializeControllers{
    
    ARFBooksViewController *booksVC = [[ARFBooksViewController alloc] initWithFetchedResultsController:[ARFBookTags createFRCForTable]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        //Selección de la última celda visitada
        NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
        ARFBookTags *lastItem = [ARFBookTags objectWithArchivedURIRepresentation:lastObjectData context:[NSManagedObjectContext MR_defaultContext]];
        
        ARFBook *lastBook;
        
        //Determinar si hay un ultimo libro
        
        if (lastItem) {
            lastBook = lastItem.book;
        }
        else{
            
            //Caso primera vez
            ARFBookTags *firstElement = [booksVC.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            lastBook = firstElement.book;
        }
        
        
        //Crear BookVC
        ARFBookViewController *bookVC = [[ARFBookViewController alloc] initWithBook:lastBook];
        [booksVC setDelegate:bookVC];
        
        //Empaquetar bookVC
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:bookVC];
        
        //Crear SplitView
        UISplitViewController *splitVC = [UISplitViewController new];
        [splitVC setDelegate:bookVC];
        [splitVC setViewControllers:@[booksVC,navVC]];
        
        [self presentViewController:splitVC animated:NO completion:nil];
        
    }
    else{

        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:booksVC] animated:NO completion:nil];
    }
}

@end
