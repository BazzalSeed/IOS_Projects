//
//  ViewController.m
//  lab0_2
//
//  Created by Peiyun Zeng on 1/23/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


int counter = 0;
BOOL pressed = YES;
bool i0;
bool i1;
bool i2;
bool i3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switch:(id)sender {
    if(pressed){
    i0=self.image0.hidden;
    i1=self.image1.hidden;
    i2=self.image2.hidden;
    i3=self.image3.hidden;
    
    self.image0.hidden=YES;
    self.image1.hidden=YES;
    self.image2.hidden=YES;
    self.image3.hidden=YES;
        pressed= NO;
    }
    else{
        self.image0.hidden= i0;
        self.image1.hidden= i1;
        self.image2.hidden= i2;
        self.image3.hidden= i3;
        pressed=YES;
        
    }
    
    
    
}
- (IBAction)button:(id)sender {
    if (counter==0){
        self.image0.hidden=NO;
        self.image1.hidden=YES;
        self.image2.hidden=YES;
        self.image3.hidden=YES;
        ++counter  ;
    }
    else if(counter==1){
        self.image0.hidden=YES;
        self.image1.hidden=NO;
        self.image2.hidden=YES;
        self.image3.hidden=YES;
        ++counter;
        
    }
    else if(counter==2){
        self.image0.hidden=YES;
        self.image1.hidden=YES;
        self.image2.hidden=NO;
        self.image3.hidden=YES;
        ++counter;
        
    }
    else if(counter==3){
        self.image0.hidden=YES;
        self.image1.hidden=YES;
        self.image2.hidden=YES;
        self.image3.hidden=NO;
        counter =0;
    }
    
    
    
}

@end
