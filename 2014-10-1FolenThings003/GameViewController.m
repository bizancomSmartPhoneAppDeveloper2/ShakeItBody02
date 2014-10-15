//
//  GameViewController.m
//  2014-10-1FolenThings003
//
//  Created by kotepe on H26/10/13.
//  Copyright (c) 平成26年 sectionK. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@interface GameViewController ()

@property AVAudioPlayer *appleFall;

@end



@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end


@implementation GameViewController
{
    
    GameScene *scene;
    
    
}




-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    if (!skView.scene)
    {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        scene = [GameScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [skView presentScene:scene];
    }
}




-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
    //if ( event.subtype == UIEventSubtypeMotionShake )
    {
        NSLog(@"you find me");//コードが通っているかのチェック用
        
        //callingSakeのメソッド呼び込んでいる
        [scene callingSake];
        [self appleFallSound];
    }
}





- (BOOL)shouldAutorotate
{
    return YES;
}




- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    else
    {
        return UIInterfaceOrientationMaskAll;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}




//iPhoneの画面上の上部の情報を消すかどうか？
- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)appleFallSound
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"foleDown" ofType:@"mp3"];
    NSURL *appleSoundurl = [NSURL fileURLWithPath:soundPath];
    self.appleFall = [[AVAudioPlayer alloc]initWithContentsOfURL:appleSoundurl error:NULL];
    

    {
        if (self.appleFall.playing)
        {
            self.appleFall.currentTime = 0.0;
        }
        else
        {
            [self.appleFall play];
        }
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}




@end