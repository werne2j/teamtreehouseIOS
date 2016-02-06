//
//  JWTableViewController.m
//  BlogReader
//
//  Created by Jake on 6/17/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "JWTableViewController.h"
#import "JWBlogPost.h"
#import "JWWebViewController.h"

@interface JWTableViewController ()

@end

@implementation JWTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;

    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDict objectForKey:@"posts"];
    
    for (NSDictionary *bpDict in blogPostsArray) {
        JWBlogPost *blogPost = [JWBlogPost blogPostWithTitle:[bpDict objectForKey:@"title"]];
        blogPost.author = [bpDict objectForKey:@"author"];
        blogPost.thumbnail = [bpDict objectForKey:@"thumbnail"];
        blogPost.date = [bpDict objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDict objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    JWBlogPost *blogPost = self.blogPosts[indexPath.row];
    
    if ( [blogPost.thumbnail isKindOfClass:[NSString class]]){
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        cell.imageView.image = image;
    }

    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",blogPost.author, [blogPost formattedDate]];
    
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"showBlogPost"] ) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JWBlogPost *blogPost = self.blogPosts[indexPath.row];
        
        [segue.destinationViewController setBlogPostURL: blogPost.url];
    }
}



@end
