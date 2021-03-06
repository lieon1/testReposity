

//
//  ZEBaseTableViewController.swift
//  SwfitWeiBo
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 lieon. All rights reserved.
//

import UIKit

class ZEBaseTableViewController: UITableViewController,ZEVisitorViewDelegate {

    var userLogin = false
    // 创建一个属性，但是这个属性可以为空
    var visistiorView: ZEVisitorView?

    
    override func loadView() {
        if (ZEUserAccount.loadAccount() != nil) {
            userLogin = true
        }else{
            userLogin = false
        }
        userLogin ? super.loadView() : setUpBaseView()
    }
   
    private func setUpBaseView()
    {
        visistiorView = ZEVisitorView()
        visistiorView?.delegate = self
        view = visistiorView
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ZEBaseTableViewController.loginBtnWillClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ZEBaseTableViewController.registerBtnWillClick))
    }
   
    // MARK:ZEVisitorViewDelegate
    func loginBtnWillClick() {
        print(#function)
        let navi = UINavigationController.init(rootViewController: ZEOAuthViewController())
        
        presentViewController(navi, animated: true, completion: nil)
    }
    func registerBtnWillClick() {
        print(#function)
    }
    
}
