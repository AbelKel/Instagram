//
//  InstagramTableViewCell.h
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InstagramTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postComment;

@end

NS_ASSUME_NONNULL_END
