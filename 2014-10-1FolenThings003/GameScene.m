//
//  GameScene.m
//  2014-10-1FolenThings003
//
//  Created by kotepe on H26/10/13.
//  Copyright (c) 平成26年 sectionK. All rights reserved.
//

#import "GameScene.h"






//static const uint32_t wallCategory = 0x1 << 0;




static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

//ボールの大きさをランダムで出てくるよにする決め事
static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}


@implementation GameScene

//縁に物理の壁を持たす。
- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {self.backgroundColor = [SKColor colorWithRed:0.15
                                            green:0.15
                                             blue:0.3
                                            alpha:1.0];
        //    SKNode *leftWall = [SKNode node];
        //    leftWall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.height, 1)];
        //    leftWall.physicsBody.categoryBitMask = wallCategory;
        //    leftWall.physicsBody.affectedByGravity = NO;
        //    leftWall.position = CGPointMake(0, self.size.height / 2);
        //    [self addChild:leftWall];
        //
        //
        //    SKNode *rightWall = [SKNode node];
        //    rightWall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.height, 1)];
        //    rightWall.physicsBody.categoryBitMask = wallCategory;
        //    rightWall.physicsBody.affectedByGravity = NO;
        //    rightWall.position = CGPointMake(self.size.width, self.size.height / 2);
        //    [self addChild:rightWall];
        //
        //
        //    SKNode *wall = [SKNode node];
        //
        //    wall.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        //
        //    wall.physicsBody.categoryBitMask = wallCategory;
        //    wall.physicsBody.affectedByGravity = NO;
        //
        //
        //
        
        //self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, 320, 600)];
        [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:[self frame]]];
    }
    return self;
}




//ボールを生成する
- (SKNode *)newBall
{
    SKShapeNode *ball = [SKShapeNode node];
    
    //線を針金のように曲げるようにする
    CGMutablePathRef path = CGPathCreateMutable();
    
    //ボールの最小単位、最大単位を設定
    CGFloat r = skRand(3, 30);
    
    //線を円に変える
    CGPathAddArc(path, NULL, 0, 0, r, 0, M_PI * 2, YES);
    ball.path = path;
    
    //円の色をランダムで決めている
    ball.fillColor = [SKColor colorWithRed:skRand(0, 1.0f)
                                     green:skRand(0, 1.0f)
                                      blue:skRand(0, 1.0f)
                                     alpha:skRand(0.7f, 1.0f)];
    
    //円の中の色が透明色になっている
    ball.strokeColor = [SKColor clearColor];
    
    //円がどこから出るか決めている。
    ball.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - r);
    
    //ボールが落下させる動き
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:r];
    
    return ball;
    
}






//タッチされた場所にボールを呼び出す

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if (touches.count == 1)
//{
//        UITouch *touch = [touches anyObject];
//        CGPoint location = [touch locationInNode:self];
//
//        SKNode *ball = [self newBall];
//        ball.position = location;
//        [self addChild:ball];
//    }
//}








-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}









-(void)callingSake
{
    
    //if (self = [super initWithSize:size])////ここのメソッドにはこれはいらない。
    
    SKLabelNode *aWard = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    aWard.text = @"fouk YOU";
    aWard.fontSize = 40;
    aWard.position = CGPointMake(CGRectGetMidX(self.frame), 500);
    [self addChild:aWard];
    
    
    // if ( event.subtype == UIEventSubtypeMotionShake )
    {
        
        CGPoint position = CGPointMake(CGRectGetMidX(self.frame), 500);
        
        SKNode *ball = [self newBall];
        ball.position = position;
        [self addChild:ball];
        
    }
    
    
}


-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        
        
        NSLog(@"you find me and her");
        
        [self callingSake];
        
        
        
        
        
        
        {
            //
            //        CGPoint position = CGPointMake(CGRectGetMidX(self.frame), 500);
            //
            //        SKNode *ball = [self newBall];
            //        ball.position = position;
            //        [self addChild:ball];
        }//ボールを読み込もうとして試している。
        
        
        
        
        
    }
}





@end
