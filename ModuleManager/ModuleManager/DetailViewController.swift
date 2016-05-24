//
//  DetailViewController.swift
//  ModuleManager
//
//  Created by Emiaostein on 5/24/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var handler: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tap(_:)))
        view.addGestureRecognizer(tap)
        
        print(title)
    }
    
    func tap(sender: UITapGestureRecognizer) {
        handler?()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
