//
//  MainViewController.m
//  ZengLab5
//
//  Created by Peiyun Zeng on 3/29/15.
//  Copyright (c) 2015 LZ. All rights reserved.
//

#import "MainViewController.h"
#import "LZGameViewController.h"
#import "LZGameViewController_AI.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"back.jpg"] drawInRect:self.view.bounds];
    UIImage *back = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:back];
    self.title = @"Game BattleShip";
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
- (IBAction)push:(id)sender {
   LZGameViewController_AI*game_human = [[LZGameViewController_AI alloc] initWithNibName:@"GameView" bundle:nil];
     
    game_human.title = @"Human vs Human Mode";
    [self.navigationController pushViewController:game_human animated:YES];
}
- (IBAction)push2:(id)sender {
    LZGameViewController *game_AI = [[LZGameViewController alloc] initWithNibName:@"GameView" bundle:nil];
    game_AI.title = @"Human vs AI mode";
    
       [self.navigationController pushViewController:game_AI animated:YES];

}

@end
