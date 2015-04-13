#import "ARFPhoto.h"
#import "CoreData+MagicalRecord.h"
@interface ARFPhoto ()

// Private interface goes here.

@end

@implementation ARFPhoto

+(instancetype) createPhoto{
    
    ARFPhoto *photo = [ARFPhoto MR_createEntity];
    return photo;
}

-(void) setImage:(UIImage *) image{
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}


-(UIImage *) image{
    return  [UIImage imageWithData:self.photoData];
}


@end
