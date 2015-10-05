//
//  LZGameViewController_AI.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "LZGame.h"
#import "LZGameView.h"
#import "LZShipView.h"
#import "LZShip.h"
#import "NS-Extension.h"



@interface LZGameViewController_AI : UIViewController <GameDelegate, UIAlertViewDelegate>

// IBOutlet UI

@property (strong, nonatomic) IBOutlet UINavigationBar *gameNaviBar;
@property (strong, nonatomic) IBOutlet UILabel *gameStateLabel;
@property (strong, nonatomic) IBOutlet LZGameView *shipLocationView;
@property (strong, nonatomic) IBOutlet LZGameView *shipHitView;

// Boats
@property (strong, nonatomic) IBOutlet LZShipView *shipViewCarrier;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewBattleShip;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewCruiser;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewSubmarine;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewPatrolBoat;

@property (strong, nonatomic) IBOutlet LZShipView *shipViewCarrier_;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewBattleship_;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewCruiser_;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewSubmarine_;
@property (strong, nonatomic) IBOutlet LZShipView *shipViewPatrolBoat_;

// Coded UI
@property (strong, nonatomic) UIAlertView *entryPopView;
@property (strong, nonatomic) UIAlertView *resultPopView;
@property (strong, nonatomic) UIView *waitView;

// Data
@property (strong, nonatomic) LZGame* game;
@property (nonatomic) PlayerNumber currentPlayer;

// Action
- (IBAction)shipLongPressReactor:(id)sender;
- (IBAction)shipPanGestureReactor:(id)sender;

// UI Control
- (void)lockupGridView;
- (void)unlockGridView;

// A bit of logic
- (void)nextMove;
- (void)GameRestart;

@end
