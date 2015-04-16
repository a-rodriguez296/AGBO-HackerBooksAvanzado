//
//  ARFAnnotationViewController.m
//  HackerBooksAvanzado
//
//  Created by Alejandro Rodriguez on 4/16/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

#import "ARFCreateAnnotationViewController.h"
#import "ARFBook.h"
#import "CLLocationManager+Manager.h"
#import "ARFConstants.h"
#import "UIImage+Resize.h"
#import "ARFAnnotation.h"
#import "CoreData+MagicalRecord.h"

@interface ARFCreateAnnotationViewController ()

@property (nonatomic, strong) ARFBook * book;
@property (nonatomic, strong) CLLocation * location;

@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, strong) UIImage *image;

@end

@implementation ARFCreateAnnotationViewController

-(id)initWithBook:(ARFBook *) book{
    
    if (self = [super init]) {
        _book = book;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Inicializar Location Manager
    [[CLLocationManager sharedLocationManager] startUpdatingLocationWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    [manager stopUpdating];
    [self setLocation:[locations lastObject]];
    NSLog(@"Location");
}

#pragma mark IBActions
- (IBAction)addImage:(id)sender {
    
    // Crear uipicker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    
    // mostrar
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)saveAnnotation:(id)sender {
    
    [ARFAnnotation createAnnotationWithBook:self.book text:self.txtView.text location:self.location image:self.imgView.image];
    
   NSLog(@"%lu",[ARFAnnotation MR_countOfEntities]) ;
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    _ME_WEAK
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        UIImage *resizedImage = [originalImage resizedImage:CGSizeMake(originalImage.size.width*0.75, originalImage.size.height*0.75) interpolationQuality:0.8];
        dispatch_async(dispatch_get_main_queue(), ^{
            [me.imgView setImage:resizedImage];
        });
        
    });
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
