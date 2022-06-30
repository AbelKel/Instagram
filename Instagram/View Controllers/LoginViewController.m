//
//  LoginViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid credetials" message:@"Please fill in correct username and password" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}];
            [alert addAction:cancelAction];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){}];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            [self performSegueToHome];
        }
    }];
}

- (IBAction)signUp:(id)sender {
    [self performSegueToReg];
}


- (IBAction)segueToHome:(id)sender {
    [self loginUser];
}

- (void)performSegueToReg {
    [self performSegueWithIdentifier:@"regSegue" sender:self];
}

- (void)performSegueToHome {
    [self performSegueWithIdentifier:@"segueToHome" sender:self];
}

@end
