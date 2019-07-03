//
//  Content.swift
//  MyDocuments
//
//  Created by Sharvari H V on 7/3/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import Foundation
import Cocoa

class Content: NSObject{
    @objc dynamic var contentString = ""
    
    public init(contentString: String){
        self.contentString = contentString
    }
    
}

extension Content{
    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8)!
    }
    
    func data() -> Data?{
        return contentString.data(using: .utf8)
    }
}
