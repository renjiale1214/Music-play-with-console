/*
定义一个方法，用来编辑除了播放暂停等按钮外的部分
*/

#import <MediaPlayer/MediaPlayer.h>

//这个方法用来控制音乐播放，在你的代码的播放action里调用这个方法，则音乐播放时候会在控制台显示歌曲名、专辑名/演唱者、起始时间和总时长等属性
- (void)configPlayingInfoTitle:(NSString*)musicTitle artist:(NSString*)musicArtist time:(float)musicTime currentTime:(float)currentTime
{
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        if(musicTime != 0)
        {
            NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
            [dict setObject:musicTitle forKey:MPMediaItemPropertyTitle];//歌曲名
            [dict setObject:musicArtist forKey:MPMediaItemPropertyArtist];//艺术家
            [dict setObject:[NSNumber numberWithFloat:musicTime] forKey:MPMediaItemPropertyPlaybackDuration];//总时长
            [dict setObject:[NSNumber numberWithFloat:currentTime] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];//当前播放时间
            [dict setObject:[[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"nomusic_tip_down.png"]] forKey:MPMediaItemPropertyArtwork];//专辑封面
            
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
        }
    }
}
