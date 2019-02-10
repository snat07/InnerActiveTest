//
//  ImageDownloader.h
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageDownloader : NSObject

+ (instancetype)sharedInstance;

- (void)downloadImage:(UIImageView *)imageView index:(NSInteger)index;

@end
