//
//  ARFAnnotationViewController.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/16/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@class  ARFBook;
@class ARFLocationManager;


@interface ARFCreateAnnotationViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate>

-(id)initWithBook:(ARFBook *) book;

@end
