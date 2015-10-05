//
//  AppDelegate.m
//  EmptyApplication
//
//  Created by Todd Sproull on 2/8/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    // Set up two view controllers(one will be delegate for table view)
    // set up one nav contorller has two view controllers/
    
    UIViewController * tab_viewcontroller1 = [[tabbar_ViewController1 alloc] initWithNibName:@"tabbar_ViewController1" bundle:nil];
     UIViewController * tab_viewcontroller2 = [[tabbar_ViewController2 alloc] initWithNibName:@"tabbar_ViewController2" bundle:nil];
    
     UIViewController * tab_viewcontroller3 = [[tabbar_ViewController3 alloc] initWithNibName:@"tabbar_ViewController3" bundle:nil];
    
    
    UINavigationController* tab3_nav = [[UINavigationController alloc]init];
    

    
    //Set up the tab bar name and images
    tab_viewcontroller3.tabBarItem = [[UITabBarItem alloc]
                   initWithTitle:@"tab3" image:[UIImage imageNamed:@"number3.png"] tag:0];
    tab_viewcontroller1.tabBarItem = [[UITabBarItem alloc]
                       initWithTitle:@"Welcome" image:[UIImage imageNamed:@"number1.png"] tag:0];
    tab_viewcontroller2.tabBarItem = [[UITabBarItem alloc]
                       initWithTitle:@"Table" image:[UIImage imageNamed:@"number2.png"] tag:0];
    
    tab_viewcontroller3.title = @"Nav fun Part 1";
 
    
    
    [tab3_nav pushViewController:tab_viewcontroller3 animated:YES];
    
    UITabBarController*tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers  = [ NSArray arrayWithObjects:tab_viewcontroller1,tab_viewcontroller2,tab3_nav, nil];
    self.window.rootViewController  = tabbar;
    
    

    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
