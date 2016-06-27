//
//  ViewController.m
//  AKAuth0TestApp
//
//  Created by Iuliia Zhelem on 27.06.16.
//  Copyright © 2016 Akvelon. All rights reserved.
//

#import "ViewController.h"
#import <Lock/Lock.h>
#import "AKAuth0SignUpViewController.h"

@interface ViewController ()
- (IBAction)clickCustomPrimaryButton:(id)sender;
- (IBAction)clickCustomSecondaryButton:(id)sender;
- (IBAction)clickCustomCredentialBox:(id)sender;
- (IBAction)clickCustomBackground:(id)sender;
- (IBAction)clickCustomSignUpButton:(id)sender;

@end

@implementation ViewController

- (void)openLockUI {
    A0Lock *lock = [A0Lock sharedLock];
    
    A0LockViewController *controller = [lock newLockViewController];
    controller.closable = YES;
    controller.onAuthenticationBlock = ^(A0UserProfile *profile, A0Token *token) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)changeThemeForPrimaryButton {
    [[A0Theme sharedInstance] registerDefaultTheme];
    A0Theme *myAwesomeTheme = [[A0Theme alloc] init];

    //Change color
    [myAwesomeTheme registerColor:[UIColor redColor] forKey:@"A0ThemePrimaryButtonNormalColor"];
    [myAwesomeTheme registerColor:[UIColor blueColor] forKey:@"A0ThemePrimaryButtonHighlightedColor"];
    [myAwesomeTheme registerColor:[UIColor yellowColor] forKey:@"A0ThemePrimaryButtonTextColor"];
    
    //Change image
    [myAwesomeTheme registerImageWithName:@"Image1" bundle:[NSBundle mainBundle]  forKey:@"A0ThemePrimaryButtonNormalImageName"];
    [myAwesomeTheme registerImageWithName:@"Image2" bundle:[NSBundle mainBundle]  forKey:@"A0ThemePrimaryButtonHighlightedImageName"];

    //Change font
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:17] forKey:@"A0ThemePrimaryButtonFont"];
    
    [[A0Theme sharedInstance] registerTheme:myAwesomeTheme];
}

- (void)changeThemeForSecondaryButton {
    [[A0Theme sharedInstance] registerDefaultTheme];
    A0Theme *myAwesomeTheme = [[A0Theme alloc] init];
    
    //Change color
    //[myAwesomeTheme registerColor:[UIColor greenColor] forKey:@"A0ThemeSecondaryButtonBackgroundColor"];
    [myAwesomeTheme registerColor:[UIColor blackColor] forKey:@"A0ThemeSecondaryButtonTextColor"];
    
    //Change image
    [myAwesomeTheme registerImageWithName:@"BgImage2" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeSecondaryButtonNormalImageName"];
    [myAwesomeTheme registerImageWithName:@"BgImage2" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeSecondaryButtonHighlightedImageName"];
    
    //Change font
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11] forKey:@"A0ThemeSecondaryButtonFont"];

    
    [[A0Theme sharedInstance] registerTheme:myAwesomeTheme];
}

- (void)changeThemeForCredentialBox {
    [[A0Theme sharedInstance] registerDefaultTheme];
    A0Theme *myAwesomeTheme = [[A0Theme alloc] init];
    
    //Change color
    [myAwesomeTheme registerColor:[UIColor greenColor] forKey:@"A0ThemeCredentialBoxBorderColor"];
    [myAwesomeTheme registerColor:[UIColor orangeColor] forKey:@"A0ThemeCredentialBoxSeparatorColor"];
    [myAwesomeTheme registerColor:[UIColor yellowColor] forKey:@"A0ThemeCredentialBoxBackgroundColor"];
    [myAwesomeTheme registerColor:[UIColor blueColor] forKey:@"A0ThemeTextFieldTextColor"];
    [myAwesomeTheme registerColor:[UIColor redColor] forKey:@"A0ThemeTextFieldPlaceholderTextColor"];
    [myAwesomeTheme registerColor:[UIColor greenColor] forKey:@"A0ThemeTextFieldIconColor"];
    
    //Change image
    [myAwesomeTheme registerImageWithName:@"Image1" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeIconEmail"];
    [myAwesomeTheme registerImageWithName:@"Image2" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeIconUsername"];
    [myAwesomeTheme registerImageWithName:@"Image3" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeIconLock"];
    [myAwesomeTheme registerImageWithName:@"Image1" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeIconPhone"];
    
    //Change font
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17] forKey:@"A0ThemeTextFieldFont"];
    
    [[A0Theme sharedInstance] registerTheme:myAwesomeTheme];
}

- (void)changeThemeForBackground {
    [[A0Theme sharedInstance] registerDefaultTheme];
    A0Theme *myAwesomeTheme = [[A0Theme alloc] init];
    
    //Change color
    [myAwesomeTheme registerColor:[UIColor redColor] forKey:@"A0ThemeTitleTextColor"];
    [myAwesomeTheme registerColor:[UIColor cyanColor] forKey:@"A0ThemeIconBackgroundColor"];
    //[myAwesomeTheme registerColor:[UIColor lightGrayColor] forKey:@"A0ThemeScreenBackgroundColor"];
    
    [myAwesomeTheme registerColor:[UIColor purpleColor] forKey:@"A0ThemeDescriptionTextColor"];
    [myAwesomeTheme registerColor:[UIColor redColor] forKey:@"A0ThemeSeparatorTextColor"];

    [myAwesomeTheme registerColor:[UIColor redColor] forKey:@"A0ThemeCloseButtonTintColor"];
    
    //Change image
    [myAwesomeTheme registerImageWithName:@"Smile1" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeIconImageName"];
    [myAwesomeTheme registerImageWithName:@"BgImage1" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeScreenBackgroundImageName"];
    [myAwesomeTheme registerImageWithName:@"Image3" bundle:[NSBundle mainBundle]  forKey:@"A0ThemeCloseButtonImageName"];
    
    //Change font
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:34] forKey:@"A0ThemeTitleFont"];
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20] forKey:@"A0ThemeDescriptionFont"];
    [myAwesomeTheme registerFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14] forKey:@"A0ThemeSeparatorTextFont"];
    
    [[A0Theme sharedInstance] registerTheme:myAwesomeTheme];
}

- (IBAction)clickCustomPrimaryButton:(id)sender {
    [self changeThemeForPrimaryButton];
    [self openLockUI];
}

- (IBAction)clickCustomSecondaryButton:(id)sender {
    [self changeThemeForSecondaryButton];
    [self openLockUI];
}

- (IBAction)clickCustomCredentialBox:(id)sender {
    [self changeThemeForCredentialBox];
    [self openLockUI];
}

- (IBAction)clickCustomBackground:(id)sender {
    [self changeThemeForBackground];
    [self openLockUI];
}

- (IBAction)clickCustomSignUpButton:(id)sender {
    [[A0Theme sharedInstance] registerDefaultTheme];
    A0Lock *lock = [A0Lock sharedLock];
    
    A0LockViewController *controller = [lock newLockViewController];
    controller.closable = YES;
    controller.onAuthenticationBlock = ^(A0UserProfile *profile, A0Token *token) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    
    //Create custom SignUp view controller
    controller.customSignUp = ^ UIViewController *(A0Lock *lock, A0LockEventDelegate *delegate) {
        
        AKAuth0SignUpViewController *signUpVC = (AKAuth0SignUpViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AKAuth0SignUpViewController"];
        signUpVC.lock = lock;
        signUpVC.delegate = delegate;
        
        return signUpVC;
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        navController.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    [self presentViewController:navController animated:YES completion:nil];

}
@end
