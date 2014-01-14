/*
在Appdelegate里写这一部分，需要用到MediaPlayer.framework
*/
#import <AVFoundation/AVFoundation.h>
#import "RD_MusicVC.h"//这里是自定义的音乐播放MVC
#import <AdSupport/AdSupport.h>

- (void) remoteControlReceivedWithEvent: (UIEvent *) receivedEvent {
    NSLog(@"received event!");
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        NSLog(@"event...%@",receivedEvent);
        switch (receivedEvent.subtype) {

        if ([[UIDevice currentDevice].systemVersion floatValue] <= 6.0 ) {
                    //ios6
                    case UIEventSubtypeRemoteControlTogglePlayPause: {
                      NSLog(@"控制台暂停");
                      [[RD_MusicVC sharedInstance] playAndPause:nil];
                      break;
                    }
                    
        }else{
                
                    //ios7
                   case UIEventSubtypeRemoteControlPause: {
                        NSLog(@"控制台UIEventSubtypeRemoteControlPause");
                        [[RD_MusicVC sharedInstance] playAndPause:nil];
                        break;
                     }
                   case UIEventSubtypeRemoteControlPlay: {
                        NSLog(@"控制台UIEventSubtypeRemoteControlPlay");
                        [[RD_MusicVC sharedInstance] playAndPause:nil];
                        break;
                   }

        }

            case UIEventSubtypeRemoteControlNextTrack: {
                NSLog(@"控制台下一首");
                [[RD_MusicVC sharedInstance] nextMucic:nil];
                break;
            }
            case UIEventSubtypeRemoteControlPreviousTrack: {
                NSLog(@"控制台前一首");
                [[RD_MusicVC sharedInstance] lastMusic:nil];
                break;
            }
                
            default:
                break;
        }
    }
}
