//
//  ToDoItem.swift
//  App6
//
//  Created by Kipras on 3/11/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import UIKit

class ToDoItem: Task {
    
    var check: Bool!
    
    init (name: String, check: Bool!) {
        self.check = false
        super.init(name: name)
    }
    
    // NSCoding
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(check, forKey: "check")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.check = aDecoder.decodeObjectForKey("check") as! Bool
        // Must call designated initilizer.
        super.init(coder: aDecoder)
    }
}