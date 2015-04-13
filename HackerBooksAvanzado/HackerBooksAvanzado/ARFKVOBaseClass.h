//
//  ARFKVOBaseClass.h
//  Hacker Books Avanzado
//
//  Created by Alejandro Rodriguez on 4/9/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface ARFKVOBaseClass : NSManagedObject


#pragma mark Class Methods
+(NSArray *) observableKeys;

@end
