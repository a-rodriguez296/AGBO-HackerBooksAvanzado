#import "ARFPhoto.h"
#import "ARFCoreDataUtils.h"

@interface ARFPhoto ()

// Private interface goes here.

@end

@implementation ARFPhoto

+(instancetype) createPhoto{
    
    ARFPhoto *photo = [NSEntityDescription insertNewObjectForEntityForName:[ARFPhoto entityName] inManagedObjectContext:[ARFCoreDataUtils defaultContext]];
    return photo;
}

-(void) setImage:(UIImage *) image{
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}


-(UIImage *) image{
    return  [UIImage imageWithData:self.photoData];
}


@end
