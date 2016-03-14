//
//  ToDoList.swift
//  App6
//
//  Created by Kipras on 3/11/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import UIKit

class ToDoList: Task {
    
    var items: [ToDoItem]
    var image: UIImage?
    
    init (name: String, image: UIImage?, items: [ToDoItem]) {
        self.image = image
        self.items = items
        super.init(name: name)
    }
    
    // MARK: - NSCoding
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(image, forKey: "image")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Because photo is an optional property of Meal, use conditional cast.
        self.image = aDecoder.decodeObjectForKey("image") as? UIImage
        self.items = aDecoder.decodeObjectForKey("items") as! [ToDoItem]
        // Must call designated initilizer.
        super.init(coder: aDecoder)
    }

}
