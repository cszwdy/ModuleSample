//
//  Moduler+One.swift
//  ModuleManager
//
//  Created by Emiaostein on 5/24/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import Foundation
import UIKit

private let targetName = "One"

enum OneActions: String {
    case GET = "action_DetailVC:"
    case Public = "action_PublicDetailVC:"
}

protocol OneProtocol {
    
    static func module_Detail(title: String) -> UIViewController?
    static func module_Detail(title: String, handler:() -> ()) -> UIViewController?
    static func module_PublicDetail(title: String, handler: () -> ())
}

extension Moduler: OneProtocol {
    
    static func module_Detail(title: String) -> UIViewController? {
        
        let parameters = [
            "title": title,]
        
        let vc = Moduler.target(
            targetName,
            performAction: OneActions.GET.rawValue,
            paras: parameters)?.takeUnretainedValue() as? UIViewController
        
        return vc
    }
    
    static func module_Detail(title: String, handler: () -> ()) -> UIViewController? {
        
        let parameters: [String: AnyObject] = [
            "title": title,
            "handler": FunctionWrapper(f: handler),]

        let vc = Moduler
            .target(targetName,
                    performAction: OneActions.GET.rawValue,
                    paras: parameters
            )?.takeUnretainedValue() as? UIViewController
        
        return vc
    }
    
    static func module_PublicDetail(title: String, handler: () -> ()) {
        
        let parameters: [String: AnyObject] = [
            "title": title,
            "handler": FunctionWrapper(f: handler),]
        
        Moduler
        .target(targetName,
                performAction: OneActions.Public.rawValue,
                paras: parameters
        )
    }
}