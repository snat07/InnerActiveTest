//
//  ImageDownloader.m
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import "ImageDownloader.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageDownloader()

@property(nonatomic, strong) NSArray *imagesURLs;

@end

@implementation ImageDownloader

+ (instancetype)sharedInstance {
    
    static ImageDownloader *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance listOfImageURL];
    });
    return sharedInstance;
}

- (void)downloadImage:(UIImageView *)imageView index:(NSInteger)index{
    NSString *imageURL = [self.imagesURLs objectAtIndex:index];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL]
                 placeholderImage:nil];
}

- (void)listOfImageURL {

    NSString *imagesURLsString = @"http://i.imgur.com/CqmBjo5.jpg,http://i.imgur.com/zkaAooq.jpg,http://i.imgur.com/0gqnEaY.jpg,http://i.imgur.com/9gbQ7YR.jpg,http://i.imgur.com/aFhEEby.jpg,http://i.imgur.com/0E2tgV7.jpg,http://i.imgur.com/P5JLfjk.jpg,http://i.imgur.com/nz67a4F.jpg,http://i.imgur.com/dFH34N5.jpg,http://i.imgur.com/FI49ftb.jpg,http://i.imgur.com/DvpvklR.jpg,http://i.imgur.com/DNKnbG8.jpg,http://i.imgur.com/yAdbrLp.jpg,http://i.imgur.com/55w5Km7.jpg,http://i.imgur.com/NIwNTMR.jpg";
    
    self.imagesURLs = [imagesURLsString componentsSeparatedByString: @","];
    
}

@end
