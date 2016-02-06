//
//  JWViewController.h
//  CrystalBall
//
//  Created by Jake on 6/16/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWCrystalBall;

@interface JWViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) JWCrystalBall *crystalBall;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (void) makePrediction;

@end
