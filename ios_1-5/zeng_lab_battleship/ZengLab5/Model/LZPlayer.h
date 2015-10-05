//
//  LZPlayer.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZShipView.h"

typedef enum
{
	PlayerHuman,
	PlayerComputer,
    HumanVSHuman,
    HumanVSComputer,
}PlayerType;

@interface LZPlayer : NSObject

@property (nonatomic, assign)   PlayerType type;
@property (nonatomic, strong)   NSString *name;
@property (nonatomic)           NSInteger playerID;

@property (nonatomic, strong)   NSMutableArray *ships;

@end
