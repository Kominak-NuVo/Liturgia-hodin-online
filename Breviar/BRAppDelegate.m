//
//  BRAppDelegate.m
//  Breviar
//
//  Created by Gyimesi Akos on 9/7/12.
//
//

#import "BRAppDelegate.h"
#import "BRDataSource.h"
#import "BRPrayerListViewController.h"
#import "BRSettings.h"
#import "TestFlight.h"

@implementation BRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize Google Analytics
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    // [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
	__unused id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-47206216-1"];
	
	// Initialize TestFlight
	[TestFlight takeOff:@"73264b41-5b39-4179-bf3d-b58a5e4f1185"];
    
	// Initialize UI
    if ([UINavigationBar instancesRespondToSelector:@selector(barTintColor)]) {
        [UINavigationBar appearance].barTintColor = [UIColor colorWithHex:0x833a39];
    }
	[UINavigationBar appearance].tintColor = [UIColor whiteColor];
	[UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
	// Initialize data source
	BRDataSource *dataSource = [BRDataSource instance];
	dataSource.language = @"hu"; // TODO: get from build flags
    
    // Initialize WebKit
    UIWebView *webView = [[UIWebView alloc] init];
    [webView loadHTMLString:@"(empty)" baseURL:nil];
    
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
