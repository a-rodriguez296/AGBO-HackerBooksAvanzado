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

@interface ARFCreateAnnotationViewController ()

@property (nonatomic, strong) ARFBook * book;
@property (nonatomic, strong) CLLocation * location;

@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveAnnotation;

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
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    //Inicializar Location Manager
    [[CLLocationManager sharedLocationManager] startUpdatingLocationWithDelegate:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeBook:) name:kDidSelectBookNotification object:nil];
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
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Your annotation was succesfully created!\n Tap on view annotations to see them." preferredStyle:UIAlertControllerStyleAlert];
    _ME_WEAK
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [me.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    _ME_WEAK
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        UIImage *resizedImage = [originalImage resizedImage:CGSizeMake(originalImage.size.width*0.75, originalImage.size.height*0.75) interpolationQuality:0.8];
        dispatch_async(dispatch_get_main_queue(), ^{
            [me.imgView setImage:resizedImage];
            [me checkFields];
        });
        
    });
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark UITextView Delegate
-(void)textViewDidEndEditing:(UITextView *)textView{
    [self checkFields];
}

#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    [manager stopUpdating];
    [self setLocation:[locations lastObject]];
    NSLog(@"Location");
}

#pragma mark kBookDidChangeNotification
-(void) didChangeBook:(NSNotification *) notification{
    
    ARFBook *book =(ARFBook *) notification.object;
    self.book = book;
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Attention" message:@"Your data is going to saved on the book you just clicked" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertC addAction:ok];
    [self presentViewController:alertC animated:YES completion:nil];
}

#pragma mark Utils
-(void) checkFields{
    if (self.txtView.text.length>0 || self.imgView.image != nil) {
        [self.btnSaveAnnotation setEnabled:YES];
    }
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
