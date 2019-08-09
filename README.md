# EBBannerViewDemo
swift/OC实现前台显示通知栏

iOS推送分为前台、后台、以及关闭app之后的推送这三种模式，后台和关闭是默认有通知栏的，但是前台没有通知栏，所以想要通知栏就需要监听到收到通知后手动添加通知栏，这里介绍EBBannerView的使用方法
1. 首先使用`cocoapods`导入`pod 'EBBannerView'`
2. 在桥接文件中导入头文件`#import <EBBannerView/EBBannerView.h>`
3. 启动通知栏
```
let banner = EBBannerView.banner { (make) in
      make?.object = [key:value]
      make?.content = msg //通知栏显示的消息
  }
banner?.show()
```
4. 点击通知栏的代理方法
```
  @objc private func EBBannerViewDidClickNotification(_ notification:Notification){
         let dic:Dictionary = notification.object as? Dictionary ?? [:]
         let noticeId:String = dic["noticeId"] as? String ?? ""
         self.seleNews(noticeId: noticeId)
    }
```
除了这种简单用法还有很多功能可以选择，比如选择不同的版本样式等

本地通知：<https://www.jianshu.com/p/e323e27dba15>
