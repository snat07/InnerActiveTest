//
//  VideoViewController.m
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>

static NSString *const kVideoURL = @"http://clips.vorwaerts-gmbh.de/VfE_html5.mp4";

@interface VideoViewController ()

@property (strong, nonatomic) AVPlayerItem* videoItem;
@property (strong, nonatomic) AVPlayer* videoPlayer;
@property (strong, nonatomic) AVPlayerLayer* avLayer;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (nonatomic) CMTime initTime;

@end

@implementation VideoViewController

- (void)setInitTime:(CMTime)initTime {
    _initTime = initTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:kVideoURL];
    
    self.videoItem = [AVPlayerItem playerItemWithURL:url];
    self.videoPlayer = [AVPlayer playerWithPlayerItem:self.videoItem];
    self.avLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    
    
    [self.avLayer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.avLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    self.avLayer.frame = self.view.frame;
    [self.view.layer addSublayer:self.avLayer];
    
    [self.videoPlayer seekToTime:self.initTime toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
    [self.videoPlayer play];

    [self.closeButton setTintColor:[UIColor blackColor]];
    [self.view bringSubviewToFront:self.closeButton];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (IBAction)closeButtonTapped:(id)sender {
    [self.videoPlayer pause];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
