//
//  JWImageViewController.m
//  Ribbit
//
//  Created by Jake on 6/19/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "JWImageViewController.h"

@interface JWImageViewController ()

@end

@implementation JWImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    NSString *title = [NSString stringWithFormat:@"Sent from %@", senderName];
    
    self.navigationItem.title = title;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
}



#pragma mark - Helper methods

- (void)timeout{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
