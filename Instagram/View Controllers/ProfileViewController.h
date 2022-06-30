//
//  ProfileCollectionViewController.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet PFImageView *profilePictureInCollection;

@end

NS_ASSUME_NONNULL_END
