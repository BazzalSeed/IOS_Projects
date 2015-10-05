//
//  LZGameView.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "LZGame.h"
#import "LZLineView.h"

typedef enum
{
    PlayerOne,
    PlayerTwo,
}PlayerNumber;

@interface LZGameView : UIView

@property (nonatomic, strong) id  delegate;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

- (void)doTap:(UITapGestureRecognizer *)gestureRecognizer;
- (BOOL)addTargetViewAtPoint:(CGPoint)point;

@end
