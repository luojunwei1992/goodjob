//
//  VisitorView.swift
//  ljwb
//
//  Created by comma on 16/5/20.
//  Copyright © 2016年 lj. All rights reserved.
//

import UIKit
import SnapKit


protocol VisitorViewDelegate: NSObjectProtocol {
    
    //登陆回调
    func loginBtnWillClick()
    
    //注册回调
    func registerBtnWillClick()
}

class VisitorView: UIView {
    
    weak var delegate: VisitorViewDelegate?
    
    //设置未登录界面
    func setupVisitorInfo(isHome:Bool,imageName:String,message:String) {
        
        //不是首页就隐藏
        iconView.hidden = !isHome
        
        homeIcon.image = UIImage(named: imageName)
        
        messageLabel.text = message
        
        if isHome {
            
            startAnimation()
        }
    }

   override init(frame: CGRect) {
    
        super.init(frame: frame)
    
        setupUI()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func startAnimation(){
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.removedOnCompletion = false
        
        //将动画添加到图层
        iconView.layer.addAnimation(anim, forKey: nil)
        
    }
    
    private func setupUI(){
        
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(maskBgView)
        
        //布局
        
        iconView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        homeIcon.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(224)
            make.top.equalTo(iconView.snp_bottom).offset(10)
        }
        
        maskBgView.frame = self.frame;
        
        loginButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.top.equalTo(messageLabel.snp_bottom).offset(20)
            make.left.equalTo(messageLabel)
        }
        
        registerButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.top.equalTo(messageLabel.snp_bottom).offset(20)
            make.right.equalTo(messageLabel)
        }
    
    }
    
    func loginBtnClick(){
        
        delegate?.loginBtnWillClick()
    }
    
    func registerBtnClick(){
        
        delegate?.registerBtnWillClick()
    }
    
    private lazy var iconView:UIImageView = {
        
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    
    private lazy var homeIcon:UIImageView = {
    
        let hi = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        
        return hi
    }()
    
    private lazy var messageLabel: UILabel = {
    
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.darkGrayColor()
        label.text = "打附加赛可垃圾分类考试的减肥了快速的减肥两款手机的"
        
        return label
        
    }()
    
    private lazy var  loginButton: UIButton = {
        
        let btn = UIButton ()
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "loginBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    private lazy var registerButton: UIButton = {
        
        let btn = UIButton()
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "registerBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
        
    }()
    
    private lazy var maskBgView: UIImageView = {
        
        let iv = UIImageView (image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        
        return iv
    }()
    
    

}
