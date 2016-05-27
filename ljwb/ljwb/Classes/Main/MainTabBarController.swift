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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupComposeBtn()
        
    }
    
    private func addChildViewControllers(){
    
        
        let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        
        let jsonData = NSData(contentsOfFile: jsonPath!)
        
        do{
            
            let dictArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
            
            for dict in dictArray as! [[String:String]] {
                
                addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
            }
        
        }catch{
            
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            // 添加占位控制器
            addChildViewController("NullViewController", title: "", imageName: "")
            addChildViewController("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        
        }
        
        
        
}
    
    
    private func addChildViewController(childControllerName: String, title : String, imageName:String) {
        
        
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        print(namespace)
        
        let cls:AnyClass =  NSClassFromString(namespace + "." + childControllerName)!
        
        let vcCls = cls as! UIViewController.Type
        
        let vc = vcCls.init()
        
        vc.title = title;
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        let nav = UINavigationController()
        
        nav.addChildViewController(vc)
        
        addChildViewController(nav)
        
        
    }
    
    private func setupComposeBtn() {
        
        tabBar.addSubview(composeBtn)
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
        
        let rect = CGRect(x: width * 2, y: 0, width: width, height: tabBar.bounds.height)
        
        composeBtn.frame = rect
    }
    
    func composeBtnClick() {
        print("hello")
    }
    
    //懒加载
    private lazy var composeBtn:UIButton = {
    
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        button.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        return button
        
    }()
    
    

}
