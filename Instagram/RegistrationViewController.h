//
//  RegistrationViewController.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameRegistration;
@property (weak, nonatomic) IBOutlet UITextField *registrationEmail;
@property (weak, nonatomic) IBOutlet UITextField *registrationPassword;

@end

NS_ASSUME_NONNULL_END
