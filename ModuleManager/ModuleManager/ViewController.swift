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
        
        let index = 2
        
        switch index {
        case 0:
            showPublic = !showPublic
            if showPublic {
                Moduler.module_presentPublicDetail(title, handler: handler)
            } else {
                if let detail = Moduler.module_detail(title, handler: handler) {
                    detail.view.backgroundColor = UIColor.yellowColor()
                    presentViewController(detail, animated: true, completion: nil)
                } else {
                    print("Module not Exist.")
                }
            }
        case 1:
            let url = NSURL(string: "aaa://One/action_PresentPublicDetailVC:?title=Emiaostein&name=EMiaostein")!
            Moduler.performActionWithSchemeURL(url, completed: nil)
            
        default:
            let img = UIImage(named: "Heart")!
            let image = Moduler.image_compressTo(CGSize(width: 22, height: 20))(image: img)
            Moduler.module_presentPublicDetailWithImage(image: image, handler: handler)
        }
    }
    
    class func log(name: String) {
        print(name)
    }
}

