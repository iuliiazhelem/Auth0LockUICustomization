//
//  ViewController.swift
//  AKSwiftAuth0Test
//
//  Created by Iuliia Zhelem on 07.07.16.
//  Copyright © 2016 Akvelon. All rights reserved.
//

import UIKit
import Lock

class ViewController: UIViewController {

    @IBAction func clickPrimaryButtonButton(sender: AnyObject) {
        self.changeThemeForPrimaryButton()
        self.openLockUI()
    }
    
    @IBAction func clickSecondaryButtonButton(sender: AnyObject) {
        self.changeThemeForSecondaryButton()
        self.openLockUI()
    }
    
    @IBAction func clickCredentialBoxButton(sender: AnyObject) {
        self.changeThemeForCredentialBox()
        self.openLockUI()
    }
    
    @IBAction func clickBackgroundButton(sender: AnyObject) {
        self.changeThemeForBackground()
        self.openLockUI()
    }
    
    @IBAction func clickCustomSighUpButton(sender: AnyObject) {
        A0Theme.sharedInstance().registerDefaultTheme()
        
        let controller = A0Lock.sharedLock().newLockViewController()
        controller.onAuthenticationBlock = { (profile, token) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        //Create custom SignUp view controller
        controller.customSignUp = { (lock:A0Lock, delegate:A0LockEventDelegate) in
            let signUpVC:AKAuth0SignUpViewController = UIStoryboard.init(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("AKAuth0SignUpViewController") as! AKAuth0SignUpViewController
            signUpVC.lock = lock
            signUpVC.delegate = delegate

            return signUpVC
        }
        
        let navController:UINavigationController = UINavigationController.init(rootViewController: controller)
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            navController.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        }
        self.presentViewController(navController, animated: true, completion: nil)
    }

    func openLockUI() {
        let controller = A0Lock.sharedLock().newLockViewController()
        controller.closable = true
        controller.onAuthenticationBlock = { (profile, token) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    func changeThemeForPrimaryButton() {
        A0Theme.sharedInstance().registerDefaultTheme()
        let myAwesomeTheme = A0Theme.init()
    
        //Change color
        myAwesomeTheme.registerColor(UIColor.redColor(), forKey:"A0ThemePrimaryButtonNormalColor")
        myAwesomeTheme.registerColor(UIColor.blueColor(), forKey:"A0ThemePrimaryButtonHighlightedColor")
        myAwesomeTheme.registerColor(UIColor.yellowColor(), forKey:"A0ThemePrimaryButtonTextColor")
    
        //Change image
        myAwesomeTheme.registerImageWithName("Image1", bundle: NSBundle.mainBundle(), forKey: "A0ThemePrimaryButtonNormalImageName")
        myAwesomeTheme.registerImageWithName("Image2", bundle: NSBundle.mainBundle(), forKey: "A0ThemePrimaryButtonHighlightedImageName")
    
        //Change font
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 17)!, forKey: "A0ThemePrimaryButtonFont")
    
        A0Theme.sharedInstance().registerTheme(myAwesomeTheme)
    }
    
    func changeThemeForSecondaryButton() {
        A0Theme.sharedInstance().registerDefaultTheme()
        let myAwesomeTheme = A0Theme.init()
        
        //Change color
        //myAwesomeTheme.registerColor(UIColor.greenColor(), forKey:"A0ThemeSecondaryButtonBackgroundColor")
        myAwesomeTheme.registerColor(UIColor.blackColor(), forKey:"A0ThemeSecondaryButtonTextColor")
        
        //Change image
        myAwesomeTheme.registerImageWithName("BgImage2", bundle: NSBundle.mainBundle(), forKey: "A0ThemeSecondaryButtonNormalImageName")
        myAwesomeTheme.registerImageWithName("BgImage2", bundle: NSBundle.mainBundle(), forKey: "A0ThemeSecondaryButtonHighlightedImageName")
        
        //Change font
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 11)!, forKey: "A0ThemeSecondaryButtonFont")
        
        A0Theme.sharedInstance().registerTheme(myAwesomeTheme)
    }
 
    func changeThemeForCredentialBox() {
        A0Theme.sharedInstance().registerDefaultTheme()
        let myAwesomeTheme = A0Theme.init()
        
        //Change color
        myAwesomeTheme.registerColor(UIColor.greenColor(), forKey:"A0ThemeCredentialBoxBorderColor")
        myAwesomeTheme.registerColor(UIColor.orangeColor(), forKey:"A0ThemeCredentialBoxSeparatorColor")
        myAwesomeTheme.registerColor(UIColor.yellowColor(), forKey:"A0ThemeCredentialBoxBackgroundColor")
        myAwesomeTheme.registerColor(UIColor.blueColor(), forKey:"A0ThemeTextFieldTextColor")
        myAwesomeTheme.registerColor(UIColor.redColor(), forKey:"A0ThemeTextFieldPlaceholderTextColor")
        myAwesomeTheme.registerColor(UIColor.greenColor(), forKey:"A0ThemeTextFieldIconColor")
        
        //Change image
        myAwesomeTheme.registerImageWithName("Image1", bundle: NSBundle.mainBundle(), forKey: "A0ThemeIconEmail")
        myAwesomeTheme.registerImageWithName("Image2", bundle: NSBundle.mainBundle(), forKey: "A0ThemeIconUsername")
        myAwesomeTheme.registerImageWithName("Image3", bundle: NSBundle.mainBundle(), forKey: "A0ThemeIconLock")
        myAwesomeTheme.registerImageWithName("Image1", bundle: NSBundle.mainBundle(), forKey: "A0ThemeIconPhone")
        
        //Change font
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 17)!, forKey: "A0ThemeTextFieldFont")
        
        A0Theme.sharedInstance().registerTheme(myAwesomeTheme)
    }

    func changeThemeForBackground() {
        A0Theme.sharedInstance().registerDefaultTheme()
        let myAwesomeTheme = A0Theme.init()
        
        //Change color
        myAwesomeTheme.registerColor(UIColor.redColor(), forKey:"A0ThemeTitleTextColor")
        myAwesomeTheme.registerColor(UIColor.cyanColor(), forKey:"A0ThemeIconBackgroundColor")
        //myAwesomeTheme.registerColor(UIColor.lightGrayColor(), forKey:"A0ThemeScreenBackgroundColor")
        
        myAwesomeTheme.registerColor(UIColor.purpleColor(), forKey:"A0ThemeDescriptionTextColor")
        myAwesomeTheme.registerColor(UIColor.redColor(), forKey:"A0ThemeSeparatorTextColor")
        
        myAwesomeTheme.registerColor(UIColor.redColor(), forKey:"A0ThemeCloseButtonTintColor")
        
        //Change image
        myAwesomeTheme.registerImageWithName("Smile1", bundle: NSBundle.mainBundle(), forKey: "A0ThemeIconImageName")
        myAwesomeTheme.registerImageWithName("BgImage1", bundle: NSBundle.mainBundle(), forKey: "A0ThemeScreenBackgroundImageName")
        myAwesomeTheme.registerImageWithName("Image3", bundle: NSBundle.mainBundle(), forKey: "A0ThemeCloseButtonImageName")
        
        //Change font
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 34)!, forKey: "A0ThemeTitleFont")
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 20)!, forKey: "A0ThemeDescriptionFont")
        myAwesomeTheme.registerFont(UIFont.init(name: "HelveticaNeue-Bold", size: 14)!, forKey: "A0ThemeSeparatorTextFont")
        
        A0Theme.sharedInstance().registerTheme(myAwesomeTheme)
    }
}

