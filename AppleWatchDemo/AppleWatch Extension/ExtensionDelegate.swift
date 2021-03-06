//
//  ExtensionDelegate.swift
//  AppleWatch WatchKit Extension
//
//  Created by jianghai on 15/11/6.
//  Copyright © 2015年 jianghai. All rights reserved.
//

import WatchKit
import WatchConnectivity
import CityKit

class ExtensionDelegate: NSObject, WKExtensionDelegate,WCSessionDelegate {
    
    static var _instance : ExtensionDelegate?
    var allPages : NSMutableArray = NSMutableArray(capacity: 0)
    
    static func shareDelegate()->ExtensionDelegate{
        guard let instance = _instance else{
            _instance = ExtensionDelegate()
            return _instance!
        }
        return instance
    }
    
    func applicationDidFinishLaunching() {
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }
    
    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]){
        
        print(NSUserDefaults.standardUserDefaults().integerForKey("jianghai"))
        
        print(message)
        let city = CityModel(city: "'", low: 0, high: 0)
        for (key,value) in message{
            if key == "city"{
                city.city = value as! String
            }
            if key == "low"{
                city.low = value as! Int
            }
            if key == "high"{
                city.high = value as! Int
            }
        }
        
        for vc in ExtensionDelegate.shareDelegate().allPages{
            let controller = vc as! WeatherController
            if controller.cityName == city.city{
                controller.lowTemp = city.low
                controller.highTemp = city.high
                controller.becomeCurrentPage()
            }
        }
    }
    
}
