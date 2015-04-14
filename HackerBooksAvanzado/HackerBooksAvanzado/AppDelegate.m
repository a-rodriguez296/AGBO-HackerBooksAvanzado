//
//  AppDelegate.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/12/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreData+MagicalRecord.h"
#import "ARFConstants.h"
#import "ARFBook.h"
#import "ARFBooksViewController.h"
#import "ARFTag.h"

//Borrar
#import "ARFBookApiClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Setup Magical Record
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"HackerBooks"];
    
    
    
    //Verificación si hay data en core data
    
    if ([ARFBook  MR_countOfEntities]) {
        
        //Hay data
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ARFTag entityName]];
        NSSortDescriptor *sDescriptor = [NSSortDescriptor sortDescriptorWithKey:ARFTagAttributes.tagName ascending:YES];
        [req setSortDescriptors:@[sDescriptor]];
        NSFetchedResultsController *fRC = [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:ARFTagAttributes.tagName cacheName:nil];
        ARFBooksViewController *booksVC = [[ARFBooksViewController alloc] initWithFetchedResultsController:fRC];
        
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:booksVC];
        
        self.window.rootViewController = navVC;
        
    }
    else{
        //No hay datos
    }
    
//    [ARFBookApiClient requestBooksWithURL:kBooksUrl withSuccess:^(NSArray *books) {
//        
//    } withFailure:^(NSString *error) {
//        
//    }];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
