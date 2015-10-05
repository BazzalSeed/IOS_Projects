//
//  LZShip.h
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/25/15.
//  Copyright (c) 2015 Seed. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ShipTypePatrolBoat,
    ShipTypeSubmarine,
    ShipTypeCruiser,
    ShipTypeBattleship,
    ShipTypeCarrier
}ShipType;


@interface LZShip : NSObject

// Ship Properties

@property (nonatomic, assign)   ShipType type;
@property (nonatomic, assign)   NSInteger length;

// Ship States

@property (nonatomic, strong)   NSMutableArray *segments;
@property (nonatomic, strong)   NSMutableArray *hitSegments;

// Contructor

+ (id)shipWithType:(ShipType)shipType;

- (void)saveShipSegments:(UIView*) shipView;

@end
