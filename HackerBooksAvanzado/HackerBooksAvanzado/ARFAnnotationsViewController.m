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
#import "ARFConstants.h"
#import "ARFBook.h"
#import "ARFCoreDataUtils.h"

@implementation ARFAnnotationsViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeBook:) name:kDidSelectBookNotification object:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ARFAnnotationViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
}


#pragma mark UICollectionViewDelegate
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



#pragma mark kBookDidChangeNotification
-(void) didChangeBook:(NSNotification *) notification{
    
    ARFBook *book =(ARFBook *) notification.object;
    
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[ARFAnnotation entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"%K == %@",ARFAnnotationRelationships.book,book]];
    [req setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:ARFAnnotationAttributes.modificationDate ascending:YES]]];
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:[ARFCoreDataUtils defaultContext] sectionNameKeyPath:nil cacheName:nil]];
    
    [self performFetch];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
