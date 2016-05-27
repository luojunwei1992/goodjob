//
//  BaseTableViewController.swift
//  ljwb
//
//  Created by comma on 16/5/20.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorViewDelegate {

    var userLogin:Bool = false
    
    var visitorView:VisitorView?
    
    override func loadView() {
        
        userLogin ? super.loadView() : setupVisitor()
    }
    
    private func setupVisitor(){
    
        //初始化未登录界面
        visitorView = VisitorView()
        visitorView?.delegate = self
        view = visitorView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    
    //mark -----VisitorViewDelegate
    
    func loginBtnWillClick() {
        print(__FUNCTION__)
    }
    
    func registerBtnWillClick() {
        print(__FUNCTION__)
    }

   
}
