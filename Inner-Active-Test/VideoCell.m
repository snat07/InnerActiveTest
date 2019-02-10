//
//  VideoCell.m
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import "VideoCell.h"

static NSString *const kVideoURL = @"http://clips.vorwaerts-gmbh.de/VfE_html5.mp4";

@interface VideoCell()

@property (strong, nonatomic) AVPlayerItem* videoItem;
@property (strong, nonatomic) AVPlayer* videoPlayer;
@property (strong, nonatomic) AVPlayerLayer* avLayer;

@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.avLayer setFrame:CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width,  self.contentView.frame.size.height)];
}

- (void)initVideoCell {
    if (!self.videoPlayer) {
        NSURL *url = [NSURL URLWithString:kVideoURL];
        
        self.videoItem = [AVPlayerItem playerItemWithURL:url];
        self.videoPlayer = [AVPlayer playerWithPlayerItem:self.videoItem];
        self.avLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];

        [self.avLayer setBackgroundColor:[UIColor whiteColor].CGColor];
        [self.avLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        self.avLayer.frame = self.contentView.frame;
        [self.contentView.layer addSublayer:self.avLayer];
        self.videoPlayer.muted = YES;
        
        [self.videoPlayer play];
    }
}

-(void)prepareForReuse {
    [super prepareForReuse];
    [self.videoPlayer play];
}

- (void)stopVideo {
    [self.videoPlayer pause];
    
}

- (CMTime)getCurrentTime {
    return self.videoItem.currentTime;
}

@end
