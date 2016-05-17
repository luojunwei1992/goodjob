//
//  MainTabBarController.swift
//  ljwb
//
//  Created by comma on 16/5/16.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()

        
    }
    
    private func addChildViewControllers(){
    
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    
    private func addChildViewController(childController: UIViewController, title : String, imageName:String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        tabBar.tintColor = UIColor.orangeColor();
        
        let nav = UINavigationController()
        
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
    }
    

}
