//
//  ViewController.swift
//  ModuleManager
//
//  Created by Emiaostein on 5/23/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var showPublic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        func name() {
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let title = "EMiaostein"
        let handler = { self.dismissViewControllerAnimated(true, completion: nil) }
        
        showPublic = !showPublic
        
        if showPublic {
            Moduler.module_PublicDetail(title, handler: handler)
        } else {
            if let detail = Moduler.module_Detail(title, handler: handler) {
                detail.view.backgroundColor = UIColor.yellowColor()
                presentViewController(detail, animated: true, completion: nil)
            } else {
                print("Module not Exist.")
            }
        }
    }
    
    class func log(name: String) {
        print(name)
    }
}

