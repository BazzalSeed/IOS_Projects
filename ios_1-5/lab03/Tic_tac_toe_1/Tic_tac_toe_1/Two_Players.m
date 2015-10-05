//
//  Two_Players.m
//  Tic_tac_toe_1
//
//  Created by Peiyun Zeng on 2/11/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import "Two_Players.h"

@interface Two_Players (){
    int player;}
@end

@implementation Two_Players

- (void)viewDidLoad {
    
    player = 1;
    self.whoseTurn.text =@"Welcome!";
    [super viewDidLoad];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time to Decide!" message:@"Who Goes First?" delegate:self cancelButtonTitle:@"Player 1" otherButtonTitles:@"Player 2", @"Random", nil];
    
    [alert show];
    ximage  = [UIImage imageNamed:@"cross1.png"];
    oimage = [UIImage imageNamed:@"circle.gif"];

    
    self.newgame_button.layer.borderWidth=1.0f;
    self.newgame_button.layer.borderColor=[[UIColor blackColor] CGColor];
}
- (IBAction)newgame_:(id)sender {
    [self newagme];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"New Game"]){
        [self newagme];}
    if([title isEqualToString:@"I'm Done"]){
        [self goback];
    }
    if([title isEqualToString:@"Random"]){
        NSUInteger r = arc4random_uniform(2);
        if (r==0){
            player = 1;
            self.whoseTurn.text =@"X Goes First";
        }
        else{
            player = 2;
            self.whoseTurn.text = @"O Goes First";
        }
    }
    if([title isEqualToString:@"Player 1"]){
        player =1;
        self.whoseTurn.text =@"X Goes First";
    }
    if([title isEqualToString:@"Player 2"]) {
        player = 2;
        self.whoseTurn.text = @"O Goes First";
    }
    
}
-(void)newagme{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time to Decide!" message:@"Who Goes First?" delegate:self cancelButtonTitle:@"Player 1" otherButtonTitles:@"Player 2", @"Random", nil];
    [alert show];

    self.Space1.image = Nil;
    self.Space2.image = Nil;
    self.Space3.image = Nil;
    self.Space4.image = Nil;
    self.Space5.image = Nil;
    self.Space6.image = Nil;
    self.Space7.image = Nil;
    self.Space8.image = Nil;
    self.Space9.image = Nil;
    
    
}
-(void)update_gameinfo{
   
    if ([self checkforwin]){
        NSString*msg;
        if(player ==1 ){
        msg = @"Player X has Won the Game";
        }
        else{
        msg = @"Player O has Won the Game";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:msg delegate:self cancelButtonTitle:@"New Game" otherButtonTitles:@"I'm Done", nil];
        
        [alert show];
        
        return;
    }
    if([self full]){
      
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good Job" message:@"It is a tie" delegate:self cancelButtonTitle:@"New Game" otherButtonTitles:@"I'm Done",nil];
        
        [alert show];
       
        return;
    }
    
    else{
    if(player ==1){
        player=2;
        self.whoseTurn.text = @"It is O's Turn";
        return;
        
    }
    else{
        self->player= 1;
        self.whoseTurn.text = @"It is X's Turn";
        return;
    }
    }
    
    
}
-(BOOL)full{
   
    if(self.Space1.image!=Nil&&self.Space2.image!=Nil&&self.Space3.image!=Nil&&self.Space4.image!=nil&&self.Space5.image!=Nil&&self.Space6.image!=nil&&self.Space7.image!=Nil&&self.Space8.image!=Nil&&self.Space9.image!=Nil  ){
        return true;
        
    }
    return false;
    
}

-(BOOL)checkforwin{
    
    //horizontal case
    if ((self.Space1.image==self.Space2.image)&&(self.Space2.image==self.Space3.image)&&(self.Space1.image!=Nil) ){return true;}
    else if ((self.Space4.image==self.Space5.image)&&(self.Space5.image==self.Space6.image)&&(self.Space4.image!=Nil) ){return true;}
    else if ((self.Space7.image==self.Space8.image)&&(self.Space8.image==self.Space9.image)&&(self.Space7.image!=Nil) ){return true;}
    //Vertical Case
    else if ((self.Space1.image==self.Space4.image)&&(self.Space4.image==self.Space7.image)&&(self.Space1.image!=Nil) ){return true;}
    else if ((self.Space2.image==self.Space5.image)&&(self.Space5.image==self.Space8.image)&&(self.Space2.image!=Nil) ){return true;}
    else if ((self.Space3.image==self.Space6.image)&&(self.Space6.image==self.Space9.image)&&(self.Space3.image!=Nil) ){return true;}
    //diagonal case
    else if ((self.Space1.image==self.Space5.image)&&(self.Space5.image==self.Space9.image)&&(self.Space1.image!=Nil) ){return true;}
    else if ((self.Space3.image==self.Space5.image)&&(self.Space5.image==self.Space7.image)&&(self.Space3.image!=Nil) ){return true;}
    
    else{return false;}
  
}
- (IBAction)spac1_push:(id)sender {
    if(player==1&& self.Space1.image==Nil){
        self.Space1.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space1.image==Nil){
        self.Space1.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
    
}

- (IBAction)sapce2_push:(id)sender {
    if(player==1&& self.Space2.image==Nil){
        self.Space2.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space2.image==Nil){
        self.Space2.image = oimage;
        [self update_gameinfo];
    }
    
    else{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
        [alert show];}
    }
- (IBAction)space3_push:(id)sender {
    if(player==1&& self.Space3.image==Nil){
        self.Space3.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space3.image==Nil){
        self.Space3.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}

- (IBAction)space4_push:(id)sender {
    if(player==1&& self.Space4.image==Nil){
        self.Space4.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space4.image==Nil){
        self.Space4.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}

- (IBAction)space5_push:(id)sender {
    if(player==1&& self.Space5.image==Nil){
        self.Space5.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space5.image==Nil){
        self.Space5.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}
- (IBAction)space6_push:(id)sender {
    if(player==1&& self.Space6.image==Nil){
        self.Space6.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space6.image==Nil){
        self.Space6.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}

- (IBAction)space7_push:(id)sender {
    if(player==1&& self.Space7.image==Nil){
        self.Space7.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space7.image==Nil){
        self.Space7.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}

- (IBAction)space8_push:(id)sender {
    if(player==1&& self.Space8.image==Nil){
        self.Space8.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space8.image==Nil){
        self.Space8.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
}
- (IBAction)space9_push:(id)sender {
    if(player==1&& self.Space9.image==Nil){
        self.Space9.image = ximage;
        [self update_gameinfo];
    }
    else if(player==2&& self.Space9.image==Nil){
        self.Space9.image = oimage;
        [self update_gameinfo];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Move" message:@"The spot has already been occupied" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        [alert show];}
    
}
-(void)goback{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
