//
//  ViewController.swift
//  SwiftTest_8.12
//
//  Created by HYX on 15/8/12.
//  Copyright (c) 2015年 hyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        showImage()
        var ccc =  Entity()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/************** UIKit ****************/




/*************************************/


/*************  线程服务 **************/

class mainView {
    
    var lock = NSLock()
    var imageDB = [NSString]()
    var workThread: NSThread?
    
    func show() {
        var file = NSError()
        workThread = NSThread(target: self, selector: "run", object: nil)
        workThread?.name = "后台下载的线程"
        workThread?.start()
    }
    
    func hide() {
        
        workThread?.cancel()
    }
    
    deinit{
        println("副线程消失")
    }
    
    func run() {
        
        imageDB.append("第一张")
        imageDB.append("第二张")
        imageDB.append("第三张")
        
        NSThread.sleepForTimeInterval(0.1)
        
        if NSThread.currentThread().cancelled{
            NSThread.exit()
            println("结束线程")
        }
    }
   
}

func showImage() {
    
    var view = mainView()
    view.show()
    
    while(true){
        
        var date = NSDate()
        NSRunLoop.currentRunLoop().runUntilDate(date.dateByAddingTimeInterval(30))
        break
    }
    view.hide()
    
}

/************************************/

