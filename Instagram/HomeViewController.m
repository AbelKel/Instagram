//
//  HomeViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapLogout:(id)sender {
    NSLog(@"Works");
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
        self.view.window.rootViewController = loginViewController;
    }];
}

- (IBAction)tapCompose:(id)sender {
    [self performSegueWithIdentifier:@"showCompose" sender:self];
}



@end
