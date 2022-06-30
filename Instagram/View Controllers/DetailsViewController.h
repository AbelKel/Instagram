//
//  DetailsViewController.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/28/22.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *detailsCreatedAt;
@property (weak, nonatomic) IBOutlet UILabel *detailsCaption;
@property (weak, nonatomic) IBOutlet PFImageView *detailsImage;

@end

NS_ASSUME_NONNULL_END
