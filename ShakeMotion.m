//
//  ShakeMotion.m
//  2014-10-1FolenThings003
//
//  Created by kotepe on H26/10/13.
//  Copyright (c) 平成26年 sectionK. All rights reserved.
//
#import "ShakeMotion.h"
//
//@interface ShakeMotion ()
//
//@end
//
@implementation ShakeMotion


//
//- (id)initWithNibName:(NSString *)nibNameOrNil
//               bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self)
//    {
//        // Custom initialization
//    }
//    return self;
//}
//
//
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//
//
//
//- (BOOL)canBecomeFirstResponder
//{
//    return YES;
//}
//
//
//
//
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
//    {
//        NSString *text = self.textView.text;
//        self.textView.text = [text stringByAppendingString:@"\nMotion began"];
//    }
//}
//
//
//
//
//
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
//    {
//        NSString *text = self.textView.text;
//        self.textView.text = [text stringByAppendingString:@"\nMotion cancelled"];
//    }
//}
//
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
//    {
//        NSString *text = self.textView.text;
//        self.textView.text = [text stringByAppendingString:@"\nMotion ended"];
//    }
//}
//
-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        SKLabelNode *aWard = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        aWard.text = @"fouck YOU";
        aWard.fontSize = 40;
        aWard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:aWard];
        
    }
    return self;
}

@end
