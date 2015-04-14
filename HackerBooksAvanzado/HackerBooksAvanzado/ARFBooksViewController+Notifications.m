//
//  ARFBooksViewController+Notifications.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/14/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFBooksViewController+Notifications.h"

@implementation ARFBooksViewController (Notifications)

-(void)didChangeBookModel:(NSNotification *) notification{

    [self performFetch];
    
}

@end
