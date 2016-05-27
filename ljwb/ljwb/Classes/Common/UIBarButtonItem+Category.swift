//
//  UIBarButtonItem+Category.swift
//  ljwb
//
//  Created by comma on 16/5/27.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit


extension UIBarButtonItem{

    class func creatBarButtonItem(imageName:String, target: AnyObject?, action:Selector) ->UIBarButtonItem{
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        
        return UIBarButtonItem(customView: btn)
    }
}