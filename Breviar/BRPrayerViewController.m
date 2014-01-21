//
//  BRPrayerViewController.m
//  Breviar
//
//  Created by Gyimesi Akos on 9/7/12.
//
//

#import "BRPrayerViewController.h"
#import "BRSettings.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@interface BRPrayerViewController ()

@end

@implementation BRPrayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHideNavbar:)];
	tapGesture.delegate = self;
	[self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated {
	self.navigationItem.title = self.prayer.title;
    // The body will get generated on demand, if it hasn't been already generated by previous request
	self.htmlContent = self.prayer.body;
	[super viewWillAppear:animated];

	id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
	[tracker set:kGAIScreenName value:[NSString stringWithFormat:@"Prayer/%@", self.prayer.prayerName]];
	[tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)showHideNavbar:(id)sender
{
	BOOL navbarHidden = [UIApplication sharedApplication].isStatusBarHidden;
	
	if (navbarHidden) {
		self.navigationController.navigationBarHidden = NO;
		self.navigationController.navigationBar.alpha = 0;
	}
	
	[UIView animateWithDuration:UINavigationControllerHideShowBarDuration
					 animations:^{
						 [[UIApplication sharedApplication] setStatusBarHidden:!navbarHidden withAnimation:UIStatusBarAnimationFade];
						 self.navigationController.navigationBar.alpha = navbarHidden ? 1.0 : 0.0;
					 }
					 completion:^(BOOL finished) {
						 if (finished && !navbarHidden) {
							 self.navigationController.navigationBarHidden = YES;
						 }
					 }
	 ];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}

@end
