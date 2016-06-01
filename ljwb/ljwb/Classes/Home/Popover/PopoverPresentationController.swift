//
//  PopoverPresentationController.swift
//  ljwb
//
//  Created by comma on 16/6/1.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    
//    负责转场动画的对象
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentedViewController)
        
        
        print(presentedViewController)
        
    }
    
//    即将布局转场子视图的调用
    
    override func containerViewWillLayoutSubviews() {
        
//        presentedView()被展现的视图      containerView 容器视图
        
        presentedView()?.frame = CGRectMake(100, 59, 200, 200)
        containerView?.insertSubview(coverView, atIndex: 0)
        
    }
    
    private lazy var coverView: UIView = {
        
        let view  = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.mainScreen().bounds
        
        let tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        
        return view
        
    }()
    
    func close(){
        
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
