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
#import "ARFBooksViewController+Notifications.h"



@interface ARFBooksViewController ()

@end

@implementation ARFBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Hacker Books"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class])  bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    //Selección de la última celda visitada
    NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
    ARFTag *lastTag = [ARFTag objectWithArchivedURIRepresentation:lastObjectData context:[NSManagedObjectContext MR_defaultContext]];
    if (lastTag) {
        NSIndexPath *lastSelectedIndexPath =[self.fetchedResultsController indexPathForObject:lastTag];
        [self.tableView selectRowAtIndexPath:lastSelectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
    
    //Suscripción a notificaciones
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeBookModel:) name:kDidChangeBookNotification object:nil];
}


-(void)booksViewController:(ARFBooksViewController *)libraryVC didSelectBook:(ARFBook *)book{
    
    ARFBookViewController *bookVC = [[ARFBookViewController alloc] initWithBook:book];
    [self.navigationController pushViewController:bookVC animated:YES];
    
}


@end
