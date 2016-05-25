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
    case Public = "action_PresentPublicDetailVC:"
}

protocol OneProtocol {
    
    static func module_detail(title: String) -> UIViewController?
    static func module_detail(title: String, handler:() -> ()) -> UIViewController?
    static func module_presentPublicDetail(title: String, handler: () -> ())
    static func module_presentPublicDetailWithImage(title: String, image: UIImage, handler:() -> ())
}

extension Moduler: OneProtocol {
    
    static func module_detail(title: String) -> UIViewController? {
        
        let parameters = [
            "title": title,]
        
        let vc = Moduler.target(
            targetName,
            performAction: OneActions.GET.rawValue,
            paras: parameters)?.takeUnretainedValue() as? UIViewController
        
        return vc
    }
    
    static func module_detail(title: String, handler: () -> ()) -> UIViewController? {
        
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
    
    static func module_presentPublicDetail(title: String, handler: () -> ()) {
        
        let parameters: [String: AnyObject] = [
            "title": title,
            "handler": FunctionWrapper(f: handler),]
        
        Moduler
        .target(targetName,
                performAction: OneActions.Public.rawValue,
                paras: parameters
        )
    }
    
    static func module_presentPublicDetailWithImage(title: String = "Emiaostein", image: UIImage, handler:() -> ()) {
        
        let parameters: [String: AnyObject] = [
            "title": title,
            "image": image,
            "handler": FunctionWrapper(f: handler),]
        
        Moduler
            .target(targetName,
                    performAction: OneActions.Public.rawValue,
                    paras: parameters
        )
    }
}