#import "_ARFPhoto.h"
@import UIKit;

@interface ARFPhoto : _ARFPhoto {}

@property (nonatomic, strong) UIImage *image;

+(instancetype) createPhoto;

-(void) setImage:(UIImage *) image;
-(UIImage *) image;

@end
