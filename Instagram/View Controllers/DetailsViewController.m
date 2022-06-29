//
//  DetailsViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/28/22.
//

#import "DetailsViewController.h"
#import <parse/Parse.h>
#import "InstagramTableViewCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailsCaption.text = self.post.caption;
    self.detailsImage.file = self.post.image;
    [self.detailsImage loadInBackground];
    NSDate *tweetDate = self.post.createdAt;
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
    formatter.allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour;
    NSString *elapsed = [formatter stringFromDate:tweetDate toDate:[NSDate date]];
    self.detailsCreatedAt.text = elapsed;
}

- (IBAction)backButtonDetails:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
