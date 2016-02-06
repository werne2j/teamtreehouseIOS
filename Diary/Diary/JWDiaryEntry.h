//
//  JWDiaryEntry.h
//  Diary
//
//  Created by Jake on 6/19/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, JWDiaryEntryMood){
    JWDiaryEntryMoodGood = 0,
    JWDiaryEntryMoodAverage = 1,
    JWDiaryEntryMoodBad = 2
};

@interface JWDiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@property (nonatomic, readonly) NSString *sectionName;

@end
