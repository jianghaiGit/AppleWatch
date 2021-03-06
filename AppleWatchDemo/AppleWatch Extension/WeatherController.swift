//
//  WeatherController.swift
//  AppleWatch
//
//  Created by jianghai on 15/11/12.
//  Copyright © 2015年 jianghai. All rights reserved.
//

import WatchKit


class WeatherController: WKInterfaceController {
    
    static var index = 0
    @IBOutlet var low: WKInterfaceLabel!
    @IBOutlet var high: WKInterfaceLabel!
    
    var lowTemp : Int = 0
    var highTemp : Int = 0
    
    var vcIndex = 0
    var cityName : String?
    
    let cities  = ["成都","北京","上海","南京"]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        WeatherController.index += 1
        
        vcIndex = WeatherController.index
        self.cityName = cities[vcIndex-1]
        ExtensionDelegate.shareDelegate().allPages.addObject(self)
        // Configure interface objects here.
    }
    

    override func handleUserActivity(userInfo: [NSObject : AnyObject]?) {
        if let info = userInfo{
            
            for (key,value) in info{
                print("key:\(key)__value:\(value)")
            }
        }
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("\(vcIndex)-------\(__FUNCTION__)")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        print("\(vcIndex)-------\(__FUNCTION__)")
    }
    override func didAppear() {
        super.didAppear()
        self.low.setText(String(lowTemp))
        self.high.setText(String(highTemp))
    }
}