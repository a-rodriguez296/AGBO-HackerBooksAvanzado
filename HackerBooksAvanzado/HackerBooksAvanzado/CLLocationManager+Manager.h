//
//  CLLocationManager+Manager.h
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/16/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (Manager)

+(CLLocationManager *) sharedLocationManager;
-(void) startUpdatingLocationWithDelegate:(id) delegate;
-(void) stopUpdating;
@end
