//
//  JWEntryCell.h
//  Diary
//
//  Created by Jake on 6/19/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWDiaryEntry;

@interface JWEntryCell : UITableViewCell

+ (CGFloat)heightForEntry:(JWDiaryEntry *)entry;

- (void)configureCellForEntry:(JWDiaryEntry *)entry;

@end
