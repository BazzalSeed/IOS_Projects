//
//  Two_Players.h
//  Tic_tac_toe_1
//
//  Created by Peiyun Zeng on 2/11/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Two_Players : UIViewController<UIAlertViewDelegate>{
    IBOutlet UIImage *ximage;
    IBOutlet UIImage *oimage;
    //IBOutlet UIImage *background;
    //int player ;
    
    
}
@property (weak, nonatomic) IBOutlet UIButton *newgame_button;
@property (weak, nonatomic) IBOutlet UITextField *whoseTurn;
@property (weak, nonatomic) IBOutlet UIImageView *Space1;
@property (weak, nonatomic) IBOutlet UIImageView *Space2;
@property (weak, nonatomic) IBOutlet UIImageView *Space3;
@property (weak, nonatomic) IBOutlet UIImageView *Space4;
@property (weak, nonatomic) IBOutlet UIImageView *Space5;
@property (weak, nonatomic) IBOutlet UIImageView *Space6;
@property (weak, nonatomic) IBOutlet UIImageView *Space7;
@property (weak, nonatomic) IBOutlet UIImageView *Space8;
@property (weak, nonatomic) IBOutlet UIImageView *Space9;

-(void) update_gameinfo;
-(void)  newagme;
-(BOOL)  checkforwin;
-(BOOL) full;
-(void)goback;

@end
