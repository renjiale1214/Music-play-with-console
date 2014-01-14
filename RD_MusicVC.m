/*
定义一个方法，用来编辑除了播放暂停等按钮外的部分
*/

#import <MediaPlayer/MediaPlayer.h>


- (void)configPlayingInfoTitle:(NSString*)musicTitle artist:(NSString*)musicArtist time:(float)musicTime currentTime:(float)currentTime
{
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        if(musicTime != 0)
        {
            NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
            [dict setObject:musicTitle forKey:MPMediaItemPropertyTitle];
            [dict setObject:musicArtist forKey:MPMediaItemPropertyArtist];
            [dict setObject:[NSNumber numberWithFloat:musicTime] forKey:MPMediaItemPropertyPlaybackDuration];
            [dict setObject:[NSNumber numberWithFloat:currentTime] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
            [dict setObject:[[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"nomusic_tip_down.png"]] forKey:MPMediaItemPropertyArtwork];
            
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
        }
    }
}
