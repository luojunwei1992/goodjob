//
//  AppDelegate.swift
//  ljwb
//
//  Created by comma on 16/5/16.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.backgroundColor = UIColor.whiteColor()
        
        window?.rootViewController = MainTabBarController()
        
        window?.makeKeyAndVisible()
        
        
        return true
    }

  
}

