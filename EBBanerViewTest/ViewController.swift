//
//  ViewController.swift
//  EBBanerViewTest
//
//  Created by 纪志刚 on 2019/8/9.
//  Copyright © 2019 纪志刚. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //使用第三方库实现前台接收消息有通知栏的功能 注册点击前台通知栏的通知
        NotificationCenter.default.addObserver(self, selector: #selector(EBBannerViewDidClickNotification(_:)), name: NSNotification.Name.init(rawValue: "EBBannerViewDidClickNotification"), object: nil)
        
        
        
        let EBbtn = UIButton.init(type: .custom)
        EBbtn.backgroundColor = UIColor.yellow
        EBbtn.frame = CGRect.init(x: 100, y: 100, width: 150, height: 40)
        EBbtn.setTitle("EB本地通知栏", for: .normal)
        EBbtn.setTitleColor(UIColor.red, for: .normal)
        EBbtn.addTarget(self, action: #selector(btnOne(_:)), for: .touchUpInside)
        self.view.addSubview(EBbtn)
        
        
        let EBlabel = UILabel.init()
        EBlabel.numberOfLines = 0
        EBlabel.frame = CGRect.init(x: 100, y: 160, width: 150, height: 100)
        EBlabel.textColor = UIColor.gray
        EBlabel.text = "⚠️ EBBannerView不是通知栏，是自定义view，iOS9之后应用处于前台不能显示通知栏"
        self.view.addSubview(EBlabel)
        
        
        
        
        
        let localNFBtn = UIButton.init(type: .custom)
        localNFBtn.backgroundColor = UIColor.yellow
        localNFBtn.frame = CGRect.init(x: 100, y: 300, width: 150, height: 40)
        localNFBtn.setTitle("本地通知", for: .normal)
        localNFBtn.setTitleColor(UIColor.red, for: .normal)
        localNFBtn.addTarget(self, action: #selector(btnTwo(_:)), for: .touchUpInside)
        self.view.addSubview(localNFBtn)
        
        
        let label = UILabel.init()
        label.numberOfLines = 0
        label.frame = CGRect.init(x: 100, y: 360, width: 150, height: 100)
        label.textColor = UIColor.gray
        label.text = "⚠️ 本地通知不能吊起通知栏,点击之后退出到桌面10秒可以看到通知栏"
        self.view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }

    
    
    /// EBBanner
    ///
    /// - Parameter btn: <#btn description#>
    @objc func btnOne(_ btn:UIButton){
        let banner = EBBannerView.banner { (make) in
            make?.object = ["noticeId":"我是noticeId"]
            make?.content = "我是content"
        }
        banner?.show()
    }
    
    @objc private func EBBannerViewDidClickNotification(_ notification:Notification){
        let dic:Dictionary = notification.object as? Dictionary ?? [:]
        let noticeId:String = dic["noticeId"] as? String ?? ""
        print("点击通知栏了noticeId="+noticeId)
    }

    
    
    
    
    
    
    
    
    
    /// localNotification
    ///
    /// - Parameter btn: <#btn description#>
    @objc func btnTwo(_ btn:UIButton){
        //设置推送内容
        let content = UNMutableNotificationContent()
        content.title = "hangge.com"
        content.body = "做最好的开发者知识平台"
        
        //设置通知触发器
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        //设置请求标识符
        let requestIdentifier = "com.hangge.testNotification"
        
        //设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        //将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request) { error in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }
    }

    
}

