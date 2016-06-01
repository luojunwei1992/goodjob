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
        
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = self
        
        vc?.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        presentViewController(vc!, animated: true, completion: nil)
        
    }
    
    func leftItemClick(){
        
        print(__FUNCTION__)
    }
    
    func rightItemClick(){
        
        print(__FUNCTION__)
    }
    
    private lazy var popover:PopoverViewController = {
        
        let pop = PopoverViewController()
        
        return pop
    }()
    
    /// 记录当前是否是展开
    var isPresent: Bool = false

}


extension HomeTableViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
    
        return PopoverPresentationController(presentedViewController: presented, presentingViewController:  presenting)
    }
    
//  告诉系统谁来负责modal的展现动画  谁来负责，只要实现该方法，系统自带的动画就没有了   presented  被展现的视图 presenting 发起的视图
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        return self
        
    }
    
//    告诉系统谁来负责modal的消失动画 dismissed 被关闭的视图
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = false
        
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
            
            toView?.transform = CGAffineTransformMakeScale(1.0, 0.001)
            
            transitionContext.containerView()?.addSubview(toView!)
            
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView.animateWithDuration(0.5, animations: { 
                
                //清空transform
                toView?.transform = CGAffineTransformIdentity
                
                }, completion: { (_) in
                    
                    //动画执行完后告诉系统
                    transitionContext.completeTransition(true)
            })
        
        }
    }
}
