//
//  HomeViewController.m
//  Instagram
//
//  Created by Abel Kelbessa on 6/27/22.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "InstagramTableViewCell.h"
#import "Post.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *foundPosts;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate= self;
    self.tableView.dataSource = self;
    [self getPosts];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];

}

//- (void)beginRefresh:(UIRefreshControl *)refreshControl {
//        NSURL *url =
//        NSURL *request =
//        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
//                                                              delegate:nil
//                                                         delegateQueue:[NSOperationQueue mainQueue]];
//        session.configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            [self.tableView reloadData];
//            [refreshControl endRefreshing];
//
//        }];
//
//        [task resume];
//}

-(void)getPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//    [query whereKey:@"likesCount" greaterThan:@0];
    query.limit = 20;

    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.foundPosts = posts;
            [self.tableView reloadData];
            NSLog(@"%@", self.foundPosts);
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)didTapLogout:(id)sender {
    NSLog(@"Works");
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
        self.view.window.rootViewController = loginViewController;
    }];
}

- (IBAction)tapCompose:(id)sender {
    [self performSegueWithIdentifier:@"showCompose" sender:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foundPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    Post *postIG = self.foundPosts[indexPath.row];
    cell.postComment.text = postIG.caption;
    cell.photoImageView.file = self.foundPosts[indexPath.row][@"image"];
    [cell.photoImageView loadInBackground];
    return cell;
}



@end
