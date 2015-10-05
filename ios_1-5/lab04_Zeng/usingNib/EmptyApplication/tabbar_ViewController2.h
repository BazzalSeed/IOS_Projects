//
//  tabbar_ViewController2.h
//  EmptyApplication
//
//  Created by Peiyun Zeng on 2/25/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tabbar_ViewController2: UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
}

//Get access to tableview created in Xib file
@property (weak, nonatomic) IBOutlet UITableView *tableviewObject;

@property (nonatomic,retain)NSMutableArray*tableData;
@end
