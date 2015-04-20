//
//  ARFAnnotationViewCell.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/19/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARFAnnotationViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgAnnotation;

@end
