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
#import "ARFTag.h"
#import "ARFBookViewController.h"
#import "ARFInitialScreen.h"
#import "ARFCoreDataUtils.h"
#import "ARFBookTag.h"
#import "AGTCoreDataStack.h"

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
    
    [self presentViewController:[ARFInitialScreen createInitialViewController] animated:YES completion:nil];
    
}

@end
