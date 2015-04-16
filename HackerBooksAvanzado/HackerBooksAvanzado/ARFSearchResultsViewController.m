//
//  ARFSearchResultsViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/15/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFSearchResultsViewController.h"
#import "ARFBookCell.h"
#import "ARFBook.h"

static NSString * const  cellIdentifier = @"Cell";

@interface ARFSearchResultsViewController ()


@end

@implementation ARFSearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFBookCell class]) bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.filteredBooks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFBook *book = self.filteredBooks[indexPath.row];
    //Crear la celda
    ARFBookCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //Llenar la celda
    [cell.lblTitle setText:book.title];
    [cell.lblAuthor setText:[ARFBook authorsWithBook:book]];
    
    //Devolver la celda
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}


-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFBook *book = self.filteredBooks[indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate searchController:self didSelectItem:book];
}
@end
