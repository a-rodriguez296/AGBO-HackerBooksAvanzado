//
//  ARFAnnotationsViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/19/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFAnnotationsViewController.h"
#import "ARFAnnotationViewCell.h"
#import "ARFAnnotation.h"
#import "ARFPhoto.h"

@implementation ARFAnnotationsViewController



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFAnnotationViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
}


-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ARFAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    ARFAnnotationViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [cell.lblDate setText:[formatter stringFromDate:annotation.creationDate]];
    [cell.imgAnnotation setImage:annotation.image.image];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ARFAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [annotation setText:@"Hola"];
}

@end
