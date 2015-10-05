//
//  main.m
//  Lab2
//
//  Created by Peiyun Zeng on 1/31/15.
//  Copyright (c) 2015 Peiyun Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//Section 1
void PrintMDict(){
    
    // Build the dictionary
    //Use + constructor dictionary with objects: (values) for keys:(keys)
    NSArray* keys = @[@"Centimeter",@"Pound",@"Ounce",@"Kilogram",@"Yard",@"Millimeter",@"Kilometer"];
    NSArray *values = @[@1,@4,@4,@2,@3,@1,@1];
    NSDictionary *mydic =[NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    
    //Testing weather the built dictionary is correct
    NSLog(@"%@ %@ %@",@"-------------------",@"BEGIN TESTING INFO for Section 1",@"------------------");
    NSLog(@"%@",mydic);
    NSLog(@"We currently have %ld keys available", [mydic count]);
   NSLog(@"%@ %@ %@",@"--------------------",@"END TESTING INFO for Section 1",@"-------------------");
    NSLog(@"%@ %@ %@",@"------------------>",@"BEGIN official answers for Section 1",@"<---------------");
    
    
    //Loop through the dictionary
    for (id key in mydic) {
        //check weather the key string has a length large than five (minimum length to have @"meter" at the end)
        NSUInteger temp = [key length];
        //temp is the start index of "meter" substring
        if(temp>=5){
            temp = temp-5;
        }
        // get the substring and check weather it is "meter"
        NSString *skey =[key substringFromIndex:temp ];
        //NSLog(@"%@",skey);
        // pring out the value of the key if the substring is "meter"
        if([skey isEqual:@"meter"]){
            NSLog(@"%@",mydic[key]);
        }
    }
     NSLog(@"%@ %@ %@",@"--------------->",@"END official answers for Section 1",@"<---------------");
}

//Section 2
void PrintSet(){
    
    // intialize two sets
    // i can use @int here, yet i just want to try out new ways. NSnumber can contain more accurate value
    NSMutableSet*Set1 = [NSMutableSet setWithObjects:
     [NSNumber numberWithInt:5]
    ,[NSNumber numberWithInt:3]
    ,[NSNumber numberWithInt:2]
    ,[NSNumber numberWithInt:9]
    ,[NSNumber numberWithInt:2]
    ,[NSNumber numberWithInt:9]
    ,[NSNumber numberWithInt:7]
    ,nil                     ];
    NSMutableSet*Set2= [NSMutableSet setWithObjects:
    [NSNumber numberWithInt:3]
    ,[NSNumber numberWithInt:9]
    ,[NSNumber numberWithInt:2]
    ,[NSNumber numberWithInt:7]
    ,[NSNumber numberWithInt:7]
    ,nil                     ];
    
    
    NSLog(@"%@ %@ %@",@"-------------",@"BEGIN TESTING INFO for Section 2",@"---------------");
    NSLog(@"Set1");
    NSLog(@"%@",Set1);
    NSLog(@"Set2");
    NSLog(@"%@",Set2);
    NSLog(@"%@ %@ %@",@"---------------",@"END TESTING INFO for Section 2",@"----------------");
    //Performing the asked tasks, not worth commeting since just invoking the built-in method
    NSLog(@"%@ %@ %@",@"--------------->",@"BEGIN official answers for Section 2",@"<-----------------");
    NSLog(@"(1) Is the first set a subset on the second set?:  %s",[Set1 isSubsetOfSet:Set2]? "YES" : "NOPE");
    NSLog(@"(2) Is the second set a subset of the first set?:  %s",[Set2 isSubsetOfSet:Set1]? "YES" : "NOPE");
    NSLog(@"(3) Is 4 an element of the first set?:  %s",[Set1 containsObject:[NSNumber numberWithInt:4]]? "YES" : "NOPE");
    NSLog(@"(4) Is 2 an element of the second set?:  %s",[Set2 containsObject:[NSNumber numberWithInt:2]]? "YES" : "NOPE");
    NSLog(@"(5) Does one set intersect the other set?:  %s",[Set2 intersectsSet:Set1]? "YES" : "NOPE");
    NSLog(@"%@ %@ %@",@"---------------->",@"END official answers for Section 2",@"<-----------------");
}
//Section 3
void PrintDate(){

//Initialize calendar and formatter
//using medium style for formatter
    NSCalendar *calendar = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateStyle:NSDateFormatterMediumStyle];
//NSDateComponentsFormatter * cformatter=[[ NSDateComponentsFormatter alloc] init];
//(1)
//get today's date
NSDate *now = [NSDate date];
    NSString *Date_now = [formatter stringFromDate:now];
    NSLog(@"(1) Todays's Date: %@",Date_now);
//(2)
    
//get the time interval of eight days
NSTimeInterval eightDays = 8*24*60*60;
    //construct date eight days after today invoking method
    NSDate *eightfromnow = [NSDate dateWithTimeInterval:eightDays sinceDate:now];
   // invoking formatter
    NSString *Date_eightfromnow = [formatter stringFromDate:eightfromnow];
    NSLog(@"(2) Eight days from Today's Date: %@",Date_eightfromnow);
    

    
//(3) Get last tuesday
//I refuese to use the natural language programming thing and chose the classic approach
    

//initialize the date component that has the weekday (day of the week) information of today
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit
                                                       fromDate:now];
    
//get the week day
    NSInteger  weekday = [components weekday];

    
//distringuish two cases
//if today is a day after tuesday (weekday>3), our tuesday is within this week and 3-weekday away
// otherwise, last tuesday is at last week so that (3-weekday)- 7 away
    NSInteger  addday = 0;
    if (weekday>3){
        addday = 3 - weekday;
    }
    else{
        addday = (3 - weekday)-7;

    }
//construct the date component (of addday) for subtracting
    NSDateComponents* lasttuesday_add = [[NSDateComponents alloc]init];
    [lasttuesday_add setDay:addday];
//Get last tuesday given the days need to subtract
    NSDate*LastTuesday = [calendar dateByAddingComponents:lasttuesday_add toDate:now options:0];
    NSString*STuesday = [formatter stringFromDate:LastTuesday];
    NSLog(@"(3) Last Tuesday is: %@", STuesday );
    
    //Below is another approach that is forbiddent by Todd
    /*
    NSDateComponents *new_components = [[NSDateComponents alloc] init];//[calendar components:NSMonthCalendarUnit|NSWeekOfYearCalendarUnit|NSYearCalendarUnit|NSDayCalendarUnit fromDate:now];
    [new_components setCalendar:calendar];
    NSLog(@"test %ld",[new_components weekOfYear]);
    [new_components setYear:2015];
    [new_components setWeekOfYear: [new_components weekOfYear]+weekyear];
    [new_components setWeekday:3];
    
    NSDate*lastTuesday = [new_components date];//[calendar dateFromComponents:new_components];
    NSString*STuesday = [formatter stringFromDate:lastTuesday];
    NSLog(@"Last Tuesday is: %@", STuesday );
     */
    
    /*
    NSDateComponents *lastweek = [[NSDateComponents alloc] init];
    [lastweek setWeekOfYear:0];
    NSDate* date_temp = [calendar dateByAddingComponents:lastweek toDate:lastTuesday options:0];
    NSLog(@"%@",date_temp);

*/
//(4)
//Initialize two datecomponents object from given date
NSDateComponents *eight2712 = [[NSDateComponents alloc] init];
    [eight2712 setMonth:8];
    [eight2712 setDay:27];
    [eight2712 setYear:2012];
NSDateComponents *nine1312 = [[NSDateComponents alloc] init];
    [nine1312 setMonth:9];
    [nine1312 setDay:13];
    [nine1312 setYear:2012];
//Construct date object from date components
    NSDate*date1 = [calendar dateFromComponents:eight2712];
    NSDate*date2 = [calendar dateFromComponents:nine1312];
//Invoking built in method to answer the trivial question
    NSDate * ealierdate1 = [date1 earlierDate:date2];
    NSString*sealierdate1 = [formatter stringFromDate:ealierdate1];
    NSLog(@"(4) The earlier date between 8/27/12 and 9/13/12 is: %@",sealierdate1);
    
//(5)
//Initialize two datecomponents object from given date
    NSDateComponents *one1012 = [[NSDateComponents alloc] init];
    [one1012 setMonth:1];
    [one1012 setDay:10];
    [one1012 setYear:2012];
    NSDateComponents *twe2012 = [[NSDateComponents alloc] init];
    [twe2012 setMonth:12];
    [twe2012 setDay:20];
    [twe2012 setYear:2012];
//Construct date object from date components
    NSDate*date3 = [calendar dateFromComponents:one1012];
    NSDate*date4 = [calendar dateFromComponents:twe2012];
    //Invoking built in method to answer two trivial questions
    NSDate * ealierdate2 = [date3 laterDate:date4];
    NSString*sealierdate2 = [formatter stringFromDate:ealierdate2];
    NSLog(@"(5) The later date between 1/10/12 and 12/20/11 is: %@",sealierdate2);
}
void PrintRNumb(){
    //Create a dic key:int value:string to translate a number to corresponding string. Eg. 1 -> one
    NSDictionary*trans = @{
     [NSNumber numberWithInt:0]:@"Zero"
    ,[NSNumber numberWithInt:1]:@"One"
    ,[NSNumber numberWithInt:2]:@"Two"
    ,[NSNumber numberWithInt:3]:@"Three"
    ,[NSNumber numberWithInt:4]:@"Four"
    ,[NSNumber numberWithInt:5]:@"Five"
    ,[NSNumber numberWithInt:6]:@"Six"
    ,[NSNumber numberWithInt:7]:@"Seven"
    ,[NSNumber numberWithInt:8]:@"Eight"
    ,[NSNumber numberWithInt:9]:@"Nine"};
    
    //cretae an empty array
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    // invoke arc4tandom to generate random number 5 times
    for(int i=0;i<5;i++){
        int r = arc4random_uniform(10);
        NSNumber *x = [NSNumber numberWithInt:r];
        // create string for given number
        NSString *srandom = trans[x];
        //put the generated string to the array
        [array insertObject:srandom atIndex:0];
    }
    NSLog(@"--------------->Random Number Generated<--------------");
    for (id key in array){
        // print out all the string contained in the array
        NSLog(@"%@",key);
    }
}
int main (int argc, const char * argv[]) {
    
    @autoreleasepool {
        NSLog(@"//////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"*****************************Begin Section 1***************************************");
        PrintMDict(); // Section 1
        NSLog(@"*****************************End Section 1****************************************");
        NSLog(@"///////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"//////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"*****************************Begin Section 2**************************************");
        PrintSet(); // Section 2
        NSLog(@"*****************************End Section 2**************************************");
        NSLog(@"////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"/////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"*****************************Begin Section 3***********************************");
        PrintDate(); // Section 3
        NSLog(@"*****************************End Section 3*************************************");
        NSLog(@"////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"/////////////////////////////////////////////////////////////////////////////////");
        NSLog(@"*****************************Begin Section 4***********************************");
        PrintRNumb(); // Section 4
        NSLog(@"*****************************End Section 4***********************************");
        NSLog(@"//////////////////////////////////////////////////////////////////////////////");
    }
    return 0; }