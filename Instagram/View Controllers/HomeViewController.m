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
#import "DetailsViewController.h"

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

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
            [self.tableView reloadData];
            [self getPosts];
            [refreshControl endRefreshing];
}

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

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row + 1 == [self.foundPosts count]){
//        [self loadMoreData:[self.foundPosts count] + 20];
//    }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"detailsSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        DetailsViewController *detailsViewController = (DetailsViewController*)navigationController.topViewController;
        UITableViewCell *cell = sender;
        NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
        Post *post = self.foundPosts[indexpath.row];
        detailsViewController.post = post;
    }
}



@end
