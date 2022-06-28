//
//  ComposeViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import "ComposeViewController.h"
#import "Post.h"
#import <Parse/Parse.h>

@interface ComposeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    [self.imageToShare setImage:editedImage];

    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sharePost:(id)sender {
    if (self.imageToShare.image && self.noteToPost.text) {
           [Post postUserImage:self.imageToShare.image withCaption:self.noteToPost.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
               NSLog(@"Image posted Successfully!");
               [self dismissViewControllerAnimated:YES completion:nil];
           }];
       } else {
           NSLog(@"Missing an image and/or caption!");  
       }
    
}


@end
