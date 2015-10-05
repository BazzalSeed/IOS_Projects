//
//  One_Player.m
//  Tic_tac_toe_1
//
//  Created by Peiyun Zeng on 2/11/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import "One_Player.h"

@interface One_Player ()

@end

@implementation One_Player
- (void)viewDidLoad {
    [super viewDidLoad];
    ximage  = [UIImage imageNamed:@"cross1.png"];
    oimage = [UIImage imageNamed:@"circle.gif"];
    //background = [UIImage imageNamed:@"GameGhost.gif"];
    player = 1;
    self.whoseTurn.text =@"You are X, Time to Play";
    //self.view.backgroundColor = [UIColor colorWithPatternImage:background];
    
    self.newgame_button.layer.borderWidth=1.0f;
    self.newgame_button.layer.borderColor=[[UIColor blackColor] CGColor];
}
- (IBAction)newgame_:(id)sender {
    [self newagme];
}

-(void)newagme{
    player = 1;
    self.whoseTurn.text =@"You are X, Time to Play";
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
-(NSMutableArray*)empty_spot_indexs{
    NSMutableArray * empty=[[NSMutableArray alloc]init];
    if(self.Space1.image == Nil){
        [empty insertObject:@1 atIndex:0];
    }
    if(self.Space2.image == Nil){
        [empty insertObject:@2 atIndex:0];
    }
    if(self.Space3.image == Nil){
        [empty insertObject:@3 atIndex:0];
    }
    if(self.Space4.image == Nil){
        [empty insertObject:@4 atIndex:0];
    }
    if(self.Space5.image == Nil){
        [empty insertObject:@5 atIndex:0];
    }
    if(self.Space6.image == Nil){
        [empty insertObject:@6 atIndex:0];
    }
    if(self.Space7.image == Nil){
        [empty insertObject:@7 atIndex:0];
    }
    if(self.Space8.image == Nil){
        [empty insertObject:@8 atIndex:0];
    }
    if(self.Space9.image == Nil){
        [empty insertObject:@9 atIndex:0];
    }
    return empty;
    
}
-(BOOL)adjacent_exist:(NSInteger)i{
    switch (i) {
        case 1:
        { BOOL temp = (  (self.Space2.image == oimage&&self.Space3==nil) ||(self.Space3.image == oimage &&self.Space2.image==nil)||  (self.Space4.image == oimage&&self.Space7==nil)|| (self.Space7.image == oimage&&self.Space4==nil) );
            return  temp;
            break;
        }
        case 3:
        { BOOL temp = (  (self.Space1.image == oimage&&self.Space2==nil) ||(self.Space2.image == oimage &&self.Space1.image==nil)||  (self.Space6.image == oimage&&self.Space9==nil)|| (self.Space9.image == oimage&&self.Space6==nil) );
            return  temp;
            break;
        }
        case 7:
        { BOOL temp = (  (self.Space8.image == oimage&&self.Space9==nil) ||(self.Space9.image == oimage &&self.Space8.image==nil)||  (self.Space4.image == oimage&&self.Space1==nil)|| (self.Space1.image == oimage&&self.Space4==nil) );
            return  temp;
            break;
        }
            
        case 9:
        { BOOL temp = (  (self.Space7.image == oimage&&self.Space8==nil) ||(self.Space8.image == oimage &&self.Space7.image==nil)||  (self.Space3.image == oimage&&self.Space6==nil)|| (self.Space6.image == oimage&&self.Space3==nil) );
            return  temp;
            break;
        }
        
            
        default:
            break;
    }
    return false;
}
-(void)AI{
    NSInteger last_working_index = 0;
    NSMutableArray* empty_indexes = [self empty_spot_indexs];
    for (id key in empty_indexes){
        NSInteger intvalue = [key integerValue];
        UIImageView*temp = [self which_image:intvalue];
        temp.image = oimage;
        if([self checkforwin]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry :( !" message:@"You Lost Babe" delegate:self cancelButtonTitle:@"New Game" otherButtonTitles:@"I'm Done",nil];
            
            [alert show];
            //[self newagme];
            return;
            
        }
        temp.image= ximage;
        if ([self checkforwin]){
            temp.image = oimage;
            temp.hidden = NO;
            player = 1;
        self.whoseTurn.text = @"It is Your Turn now";
            return;
        
        }
        if([self adjacent_exist:intvalue]){
            last_working_index = intvalue;
        }
   
        temp.image = Nil;
    }
    
    if(last_working_index!=0){
        UIImageView*temp = [self which_image:last_working_index];
        temp.image = oimage;
        player = 1;
        self.whoseTurn.text = @"It is Your Turn now";
        return;

    }
    else{
        UIImageView*temp = [self which_image:[empty_indexes[0] integerValue]];
        temp.image = oimage;
        player = 1;
        self.whoseTurn.text = @"It is Your Turn now";
        return;
    }
}
-(UIImageView*)which_image:(NSInteger)i{
    
    if(i==1){
        return self.Space1;
    }
    else if (i==2){
        return self.Space2;
    }
    else if (i==3){
        return self.Space3;
    }
    else if (i==4){
        return self.Space4;
    }
    else if (i==5){
        return self.Space5;
    }
    else if (i==6){
        return self.Space6;
    }
    else if (i==7){
        return self.Space7;
    }
    else if (i==8){
        return self.Space8;
    }
    else if (i==9){
        return self.Space9;
    }
    else{
        @throw [NSException exceptionWithName:@"Invalid Index" reason:@"Not a valid index" userInfo:nil];
        
    }
    
}
-(void)update_gameinfo{
    
    if ([self checkforwin]){

        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You Have won" delegate:self cancelButtonTitle:@"New Game" otherButtonTitles:@"I'm Done",nil];
        
        [alert show];
        //[self newagme];
        return;
    }
    if([self full]){
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good Job" message:@"It is a tie" delegate:self cancelButtonTitle:@"New Game" otherButtonTitles:@"I'm Done",nil];
        
        [alert show];
        //[self newagme];
        return;
    }
    
    else{
        [self AI];
    
    }
}
-(BOOL)full{
    
    if(self.Space1.image!=Nil&&self.Space2.image!=Nil&&self.Space3.image!=Nil&&self.Space4.image!=nil&&self.Space5.image!=Nil&&self.Space6.image!=nil&&self.Space7.image!=Nil&&self.Space8.image!=Nil&&self.Space9.image!=Nil  ){
        return true;
        
    }
    return false;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
     NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"New Game"])
        [self newagme];
    if([title isEqualToString:@"I'm Done"]){
        [self goback];
    }
    
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
