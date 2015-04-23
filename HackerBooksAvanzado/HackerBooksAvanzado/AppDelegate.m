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
#import "ARFBookTags.h"
#import "ARFBooksViewController.h"
#import "ARFSplashViewController.h"
#import "ARFBookViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Setup Magical Record
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Model"];
    
    
    //Start Autosave
    [self autoSave];

    
    
    //Verificación si hay data en core data
    

    if ([ARFBook  MR_countOfEntities]>0) {
        
        //Hay data
        
        
        ARFBooksViewController *booksVC = [[ARFBooksViewController alloc] initWithFetchedResultsController:[ARFBookTags createFRCForTable]];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            
            //Selección de la última celda visitada
            NSData *lastObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:kObjectID];
            ARFBookTags *lastItem = [ARFBookTags objectWithArchivedURIRepresentation:lastObjectData context:[NSManagedObjectContext MR_defaultContext]];
            
            ARFBook *lastBook;
            
            //Determinar si hay un ultimo libro
            
            if (NO){//lastItem) {
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
            UINavigationController *navVC1  = [[UINavigationController alloc] initWithRootViewController:booksVC];
            UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:bookVC];
            
            //Crear SplitView
            UISplitViewController *splitVC = [UISplitViewController new];
            [splitVC setViewControllers:@[navVC1,navVC]];
            
            self.window.rootViewController = splitVC;
            
        }
        else{
            [booksVC setDelegate:booksVC];
            self.window.rootViewController = [[UINavigationController alloc ] initWithRootViewController:booksVC];
        }
        
        
    }
    else{
        //No hay datos
        
        ARFSplashViewController *splashVC = [[ARFSplashViewController alloc] initWithNibName:NSStringFromClass([ARFSplashViewController class]) bundle:nil];
        self.window.rootViewController = splashVC;
    }
    
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


#pragma mark Utils

-(void) autoSave{
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        // nada que hacer por aquí (en este caso).
        
    } completion:^(BOOL success, NSError *error) {
        NSLog(@"La cagamos");
    }];
    
    [self performSelector:@selector(autoSave) withObject:nil afterDelay:kAutoSave];
}

@end
