//
//  LZShipView.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "LZShip.h"
#import "LZPlayer.h"
#import "NS-Extension.h"

@interface LZShipView : UIImageView

@property (nonatomic) BOOL  isRotated;
@property (nonatomic) ShipType shipType;
@property (nonatomic) CGPoint originLocation;
@property (nonatomic, strong) UIView *originSuperView;
@property (nonatomic) CGRect originFrame;
@property (nonatomic) CGRect originBounds;
@property (nonatomic) int player;

- (void)restore;
- (void)store;

@end

