//
//  DetailsViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/28/22.
//

#import "DetailsViewController.h"
#import <parse/Parse.h>

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailsCaption.text = self.post.caption;
    self.detailsImage.file = self.post.image;
    [self.detailsImage loadInBackground];
}

//-(int) createdAt {

//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
