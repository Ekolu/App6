//
//  Refrigerator.swift
//  App6
//
//  Created by Kipras on 3/11/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import Foundation
import UIKit

// Creates a class for List, which has a name, an image and an array of elements.
class TodoManager {
    
    static let sharedInstance = TodoManager()
    
    var lists: [ToDoList]
    
    private init() {
        // Load data from plist.
        self.lists = NSKeyedUnarchiver.unarchiveObjectWithFile(self.archivePath) as? [ToDoList] ?? []
    }
    
    // Archiving Paths
    private let archivePath = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!.URLByAppendingPathComponent("Julian").path!
    
    func archive () {
        NSKeyedArchiver.archiveRootObject(self.lists, toFile: self.archivePath)
    }
}