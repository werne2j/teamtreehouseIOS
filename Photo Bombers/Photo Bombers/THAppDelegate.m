//
//  THAppDelegate.m
//  Photo Bombers
//
//  Created by Sam Soffes on 1/28/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "THAppDelegate.h"
#import "THPhotosViewController.h"

#import <SimpleAuth/SimpleAuth.h>

@implementation THAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SimpleAuth.configuration[@"instagram"] = @{
        @"client_id" : clientID,
        SimpleAuthRedirectURIKey : uriKey
    };
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    THPhotosViewController *photosViewController = [[THPhotosViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    
    UINavigationBar *navigationBar = navigationController.navigationBar;
    navigationBar.barTintColor = [UIColor colorWithRed:232.0 / 255.0 green:129.0 / 255.0 blue:91.0 / 255.0 alpha:1.0];
    navigationBar.barStyle = UIBarStyleBlackOpaque;
	navigationBar.tintColor = [UIColor whiteColor];
    
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
