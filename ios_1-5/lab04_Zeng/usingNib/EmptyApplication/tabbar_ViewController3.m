//
//  tabbar_ViewController3.m
//  EmptyApplication
//
//  Created by Peiyun Zeng on 2/25/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "tabbar_ViewController3.h"
#import "detailedview_ViewController.h"

@interface tabbar_ViewController3 ()

@end

@implementation tabbar_ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   
}
- (IBAction)push_for_more:(id)sender {
    
     UIViewController * detailed_view = [[detailedview_ViewController alloc] initWithNibName:@"detailedview_ViewController" bundle:nil];
    detailed_view.title = @"Nav fun Part 2";
    self.title =@ "Nav Fun Part 1";
   
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Part 1";
    
    self.navigationItem.backBarButtonItem = barButton;
    
    [self.navigationController pushViewController:detailed_view animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
