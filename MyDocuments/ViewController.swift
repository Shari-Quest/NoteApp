//
//  ViewController.swift
//  MyDocuments
//
//  Created by Sharvari H V on 7/3/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSTextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear() {
        super.viewDidAppear()
    }

    override var representedObject: Any? {
        didSet {
            for child in children{
                child.representedObject = representedObject
            }
        // Update the view, if already loaded.
        }
    }

    weak var document:Document?{
        if let docRepresentedObj = representedObject as? Document{
            return docRepresentedObj
        }
        return nil
    }

    func textDidBeginEditing(_ notification: Notification) {
        document?.objectDidBeginEditing(self)
    }
    
    func textDidEndEditing(_ notification: Notification) {
        document?.objectDidEndEditing(self)
    }
    
}

