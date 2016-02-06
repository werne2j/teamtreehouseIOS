//
//  JWCrystalBall.m
//  CrystalBall
//
//  Created by Jake on 6/16/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "JWCrystalBall.h"

@implementation JWCrystalBall

- (NSArray *) predictions {
    
    if (_predictions == nil){
        
        _predictions = @[@"It is Certain!", @"It is decideldy so!",
                         @"All signs say yes!", @"The stars are not aligned",
                         @"My reply is no!", @"It is doubtful!",
                         @"Better not tell you now", @"Concentrate and ask again",
                         @"Unable to answer now"];
    }
    
    return _predictions;
}

- (NSString*) randomPrediction {
    
    int random = arc4random_uniform(self.predictions.count);
    
    return [self.predictions objectAtIndex:random];
    
}

@end
