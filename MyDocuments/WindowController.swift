//
//  WindowController.swift
//  MyDocuments
//
//  Created by Sharvari H V on 7/3/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController, NSWindowDelegate{

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        shouldCascadeWindows = true
    }
    
    
}
