//
//  Post.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import "Post.h"
#import <Parse/Parse.h>

@implementation Post
    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

//+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
//
//    Post *newPost = [Post new];
//    newPost.image = [self getPFFileFromImage:image];
//    newPost.author = [PFUser currentUser];
//    newPost.caption = caption;
//    newPost.likeCount = @(0);
//    newPost.commentCount = @(0);
//
//    [newPost saveInBackgroundWithBlock: completion];
//}

//+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
//     if (!image) {
//        return nil;
//    }
//    NSData *imageData = UIImagePNGRepresentation(image);
//    if (!imageData) {
//        return nil;
//    }
//    return [PFFile fileWithName:@"image.png" data:imageData];
//}

@end