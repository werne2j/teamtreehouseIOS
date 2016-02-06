//
//  THPhotoController.h
//  Photo Bombers
//
//  Created by Sam Soffes on 1/29/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THPhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion;

+ (void)avatarForPhoto:(NSDictionary *)photo completion:(void(^)(UIImage *image))completion;

@end
