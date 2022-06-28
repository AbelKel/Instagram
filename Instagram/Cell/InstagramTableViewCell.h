//
//  InstagramTableViewCell.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"
#import "Parse.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface InstagramTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *postComment;
@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (strong, nonatomic) Post *post;
//
//@end

@end

NS_ASSUME_NONNULL_END
