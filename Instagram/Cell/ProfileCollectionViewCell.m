//
//  ProfileCollectionViewCell.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/29/22.
//

#import "ProfileCollectionViewCell.h"


@implementation ProfileCollectionViewCell

- (void)setPost:(Post *)post {
    _post = post;
    self.collectionImage.file = post[@"image"];
    [self.collectionImage loadInBackground];
}

@end
