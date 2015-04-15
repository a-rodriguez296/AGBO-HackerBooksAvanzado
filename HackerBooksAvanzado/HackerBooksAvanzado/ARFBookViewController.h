//
//  ARFBookViewController.h
//  Hacker Books
//
//  Created by Alejandro Rodriguez on 3/25/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ARFBook;
#import "ARFBooksViewController.h"

@interface ARFBookViewController : UIViewController <UISplitViewControllerDelegate, ARFBooksViewControllerDelegate>





-(id) initWithBook:(ARFBook *) book;

@end
