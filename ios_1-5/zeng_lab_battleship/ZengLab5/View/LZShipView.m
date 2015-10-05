//
//  LZShipView.m
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//


#import "LZShipView.h"

@implementation LZShipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setIsRotated: NO];
    }
    return self;
}

- (void)store
{
    [self setOriginLocation: [self center]];
    [self setOriginSuperView: [self superview]];
    [self setOriginFrame: [self frame]];
    [self setOriginBounds: [self bounds]];
}

- (void)restore
{
    [_originSuperView addSubview: self];
    [self setCenter: _originLocation];
    [self setFrame: _originFrame];
    [self setBounds: _originBounds];
    [self setUserInteractionEnabled: YES];
}

@end
