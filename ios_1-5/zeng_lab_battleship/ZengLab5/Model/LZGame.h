//
//  LZGame.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "LZPlayer.h"
#import "LZGameView.h"

typedef enum {
    GameOver,
    GameQuit,
}GameReason;

typedef enum
{
    GameStatePreparation,
    GameStatePlacing,
    GameStatePlaying,
    GameStateGameOver,
    GameStateQuitting,
}GameState;

@protocol GameDelegate <NSObject>

- (void)GamePreparation;
- (void)ShipPlacement;
- (void)GamePlaying:(int) player;
- (void)GameQuitWithReason: (GameReason) reason;
- (void)GameRestart;
- (void)GamePlayWithAI;
- (void)AIShipPlacement;

@end

@interface LZGame : NSObject

@property (nonatomic) GameState gameState;
@property (nonatomic) PlayerType gameMode;
@property (nonatomic, strong) LZPlayer *playerOne;
@property (nonatomic, strong) LZPlayer *playerTwo;
@property (nonatomic) int winner;

- (BOOL)handleGridTapPoint:(CGPoint)point ForPlayer: (int) player;
- (BOOL)isWin;

// AI
- (CGPoint)calculateAIHitPoint: (BOOL) hit_f;

@end
