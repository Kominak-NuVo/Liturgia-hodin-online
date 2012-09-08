//
//  BRPrayerListViewController.m
//  Breviar
//
//  Created by Gyimesi Akos on 9/7/12.
//
//

#import "BRPrayerListViewController.h"
#import "BRPrayerViewController.h"

@interface BRPrayerListViewController ()

@end

@implementation BRPrayerListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	BRPrayerViewController *destController = segue.destinationViewController;
	
	// Get prayer type
	NSString *segueId = segue.identifier;
	BRPrayerType prayerType = BRInvitatory;
	
	if ([segueId isEqualToString:@"ShowInvitatory"]) {
		prayerType = BRInvitatory;
	}
	else if ([segueId isEqualToString:@"ShowOfficeOfReadings"]) {
		prayerType = BROfficeOfReadings;
	}
	else if ([segueId isEqualToString:@"ShowMorningPrayer"]) {
		prayerType = BRMorningPrayer;
	}
	else if ([segueId isEqualToString:@"ShowMidMorningPrayer"]) {
		prayerType = BRMidMorningPrayer;
	}
	else if ([segueId isEqualToString:@"ShowMiddayPrayer"]) {
		prayerType = BRMiddayPrayer;
	}
	else if ([segueId isEqualToString:@"ShowMidAfternoonPrayer"]) {
		prayerType = BRMidAfternoonPrayer;
	}
	else if ([segueId isEqualToString:@"ShowEveningPrayer"]) {
		prayerType = BREveningPrayer;
	}
	else if ([segueId isEqualToString:@"ShowCompline"]) {
		prayerType = BRCompline;
	}
	else {
		NSLog(@"Unknown prayer type: %@", segueId);
	}
	
	// Generate prayer
	destController.prayer = [BRPrayer prayerWithType:prayerType date:[NSDate date]];
}

@end
