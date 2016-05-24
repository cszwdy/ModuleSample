//
//  OneActions.swift
//  ModuleManager
//
//  Created by Emiaostein on 5/24/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import UIKit

protocol OneActionsProtocol {
    static func action_DetailVC(paras: [String: AnyObject]) -> UIViewController?
    static func action_PublicDetailVC(paras: [String: AnyObject])
}

class One: NSObject, OneActionsProtocol {

    static func action_DetailVC(paras: [String: AnyObject]) -> UIViewController? {
        guard let title = paras["title"] as? String else {
            print("\(#file) no match para dic keys \(paras)")
            return nil
        }
        
        let d = DetailViewController()
        d.title = title
        
        if let handler = paras["handler"] as? FunctionWrapper<() -> ()> {
            d.handler = handler.method
        }
        
        return d
    }
    
    // show public detail vc
    static func action_PublicDetailVC(paras: [String: AnyObject]) {
        guard let title = paras["title"] as? String else {
            print("\(#file) no match para dic keys \(paras)")
            return
        }
        
        let d = DetailViewController()
        d.title = title
        
        if let handler = paras["handler"] as? FunctionWrapper<() -> ()> {
            d.handler = handler.method
        }
        
        d.view.backgroundColor = UIColor.redColor()
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(d, animated: true, completion: nil)
    }
}
