//
//  InstagramTableViewCell.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface InstagramTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postComment;
@property (strong, nonatomic) PFUser *user;

@end

NS_ASSUME_NONNULL_END
