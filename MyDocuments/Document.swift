//
//  Document.swift
//  MyDocuments
//
//  Created by Sharvari H V on 7/3/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    @objc var content = Content(contentString: "")
    var contentViewController: ViewController!
    
    override init() {
        super.init()
    }
    /*
    override var windowNibName: String? {
        // Override returning the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
        return "Document"
    }
    */

//    override func windowControllerDidLoadNib(_ aController: NSWindowController) {
//        super.windowControllerDidLoadNib(aController)
//        // Add any code here that needs to be executed once the windowController has loaded the document's window.
//    }

    override class var autosavesInPlace: Bool {
        return true
    }
    
    override func canAsynchronouslyWrite(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType) -> Bool {
        return true
    }

    override class func canConcurrentlyReadDocuments(ofType: String) -> Bool{
        return ofType == "public.plain-text"
    }
    
    override func makeWindowControllers() {
        let storyBoard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        if let windowController = storyBoard.instantiateController(withIdentifier: "WindowController") as? NSWindowController{
            addWindowController(windowController)
            
            if let contentVC = windowController.contentViewController as? ViewController{
                contentVC.representedObject = content
                contentViewController = contentVC
            }
        }
    }
    
    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        //        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        return content.data()!
        
        
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.  If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        //        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        
        content.read(from: data)
        
    }

}
