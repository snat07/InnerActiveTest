//
//  ImageCell.m
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import "ImageCell.h"
#import "ImageDownloader.h"

@interface ImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ImageCell

- (void)initWithIndex:(NSInteger)index {
    
    [[ImageDownloader sharedInstance] downloadImage:self.image index:index];
}


@end
