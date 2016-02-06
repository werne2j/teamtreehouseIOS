//
//  JWFriendsViewController.h
//  Ribbit
//
//  Created by Jake on 6/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface JWFriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendRelation;
@property (strong, nonatomic) NSArray *friends;

@end
