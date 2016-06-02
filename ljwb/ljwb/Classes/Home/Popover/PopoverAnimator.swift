//
//  PopoverAnimator.swift
//  ljwb
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit

let LJPopoverAnimatorWillShow = "LJPopoverAnimatorWillShow"
let LJPopoverAnimatorWillDismiss = "LJPopoverAnimatorWillDismiss"

class PopoverAnimator: NSObject,UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{
    
    /// 记录当前是否是展开
    var isPresent: Bool = false
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return PopoverPresentationController(presentedViewController: presented, presentingViewController:  presenting)
    }
    
    //  告诉系统谁来负责modal的展现动画  谁来负责，只要实现该方法，系统自带的动画就没有了   presented  被展现的视图 presenting 发起的视图
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        
        //发送通知，通知控制器即将展开
        NSNotificationCenter.defaultCenter().postNotificationName(LJPopoverAnimatorWillShow, object: self)
        
        return self
        
    }
    
    //    告诉系统谁来负责modal的消失动画 dismissed 被关闭的视图
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = false
        
        //发送通知，通知控制器即将消失
        NSNotificationCenter.defaultCenter().postNotificationName(LJPopoverAnimatorWillDismiss, object: self)
        
        return self
    }
    
    //    返回时长  transitionContext 里面保存了动画需要的所有参数
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        
        return 0.5
    }
    
    
    //    如何动画
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent{
            
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            
            toView?.transform = CGAffineTransformMakeScale(1.0, 0)
            
            transitionContext.containerView()?.addSubview(toView!)
            
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView.animateWithDuration(0.5, animations: {
                
                //清空transform
                toView?.transform = CGAffineTransformIdentity
                
                }, completion: { (_) in
                    
                    //动画执行完后告诉系统
                    transitionContext.completeTransition(true)
            })
            
        }else{
            
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            UIView.animateWithDuration(0.5, animations: {
                
                fromView?.transform = CGAffineTransformMakeScale(1.0, 0.000001)
                
                }, completion: { (_) in
                    
                    transitionContext.completeTransition(true)
            })
            
        }
    }

}
