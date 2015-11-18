//
//  CommonController.swift
//  AppleWatch
//
//  Created by jianghai on 15/11/12.
//  Copyright © 2015年 jianghai. All rights reserved.
//

import UIKit

class CommonController : UIViewController {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var low: UILabel!
    @IBOutlet weak var high: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch self.title!{
        case "0":
            self.view.backgroundColor = UIColor.redColor()
            
        case "1":
            self.view.backgroundColor = UIColor.yellowColor()
            
        case "2":
            self.view.backgroundColor = UIColor.grayColor()
        default:
            self.view.backgroundColor = UIColor.blackColor()
        }
    }
}
