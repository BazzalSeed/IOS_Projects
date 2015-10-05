//
//  tab2_tableview.h
//  usingStoryBoard
//
//  Created by Peiyun Zeng on 2/25/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tab2_tableview : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableviewObject;

@property (nonatomic,retain)NSMutableArray*tableData;


@end
