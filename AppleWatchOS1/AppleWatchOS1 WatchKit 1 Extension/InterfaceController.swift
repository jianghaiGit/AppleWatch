//
//  InterfaceController.swift
//  AppleWatchOS1 WatchKit 1 Extension
//
//  Created by jianghai on 15/11/17.
//  Copyright © 2015年 jianghai. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var btn: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }


    @IBAction func btnClicked() {
        let message = ["message" : "willActivate request"];
        WKInterfaceController.openParentApplication(message) { (reply : [NSObject : AnyObject], err : NSError?) -> Void in
            for (_,value) in reply{
                self.btn.setTitle(value as? String)
            }
        }
        
        self.updateUserActivity("open", userInfo: message, webpageURL: nil);
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
