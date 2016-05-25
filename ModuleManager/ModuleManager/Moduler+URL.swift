//
//  Moduler+URL.swift
//  ModuleManager
//
//  Created by Emiaostein on 5/25/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import Foundation

private let scheme = "aaa"

extension Moduler {
    /*
     scheme://[target]/[action]?[params]
     
     url sample:
     aaa://targetA/actionB?id=1234&name=EMiaostein
     */
    class func performActionWithSchemeURL(url: NSURL, completed: (([String: AnyObject]) -> ())?) {
        guard url.scheme == scheme else { return }
        
        //parameters
        var paras: [String: String] = [:]
        if let query = url.query { // id=1234&name=EMiaostein
            let kvs = query.componentsSeparatedByString("&")
            for kv in kvs {
                let r = kv.componentsSeparatedByString("=")
                let k = r[0]
                let v = r[1]
                paras[k] = v
            }
        }
        print(paras)
        
        //action name
        guard let actionName = url.path?.stringByReplacingOccurrencesOfString("/", withString: "") else { return }
        
        print(actionName)
        
        //target name
        guard let targetName = url.host else { return }
        
        target(targetName, performAction: actionName, paras: paras)
        print(targetName)
    }
}