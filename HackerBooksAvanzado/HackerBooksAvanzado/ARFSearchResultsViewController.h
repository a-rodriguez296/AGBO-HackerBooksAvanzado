//
//  ARFSearchResultsViewController.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/15/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARFSearchResultsViewController : UIViewController

@property (nonatomic, strong) NSArray * filteredBooks;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
