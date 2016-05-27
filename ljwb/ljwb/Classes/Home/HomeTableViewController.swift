//
//  HomeTableViewController.swift
//  ljwb
//
//  Created by comma on 16/5/16.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //未登录
        if !userLogin
        {
            visitorView?.setupVisitorInfo(false, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
        }
        
        //登录状态c
        setupNav()

    }
    
    private func setupNav(){
    
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_friendattention", target: self, action: "leftItemClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_pop", target: self, action: "rightItemClick")
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("新浪微博 ", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        navigationItem.titleView = titleBtn
        
    }
    
     func titleBtnClick(btn: UIButton){
        
        btn.selected = !btn.selected
    }
    
    func leftItemClick(){
        
        print(__FUNCTION__)
    }
    
    func rightItemClick(){
        
        print(__FUNCTION__)
    }
}
