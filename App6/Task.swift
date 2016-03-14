//
//  Task.swift
//  App6
//
//  Created by Kipras on 3/11/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import UIKit

class Task: NSObject, NSCoding {
    
    var name: String
    
    
    init(name: String) {
        // Initialize stored properties.
        self.name = name
    }
    
    // NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        // Must call designated initilizer.
    }

    
    
}
