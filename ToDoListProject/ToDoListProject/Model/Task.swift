//
//  Task.swift
//  ToDoListProject
//
//  Created by Claudiu Haidu on 20/10/2018.
//  Copyright © 2018 Claudiu Haidu. All rights reserved.
//

import RealmSwift
import Foundation

class Task: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String?
    @objc dynamic var isFinished = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: String, name: String, isFinished: Bool) {
        self.init()
        self.id = id
        self.name = name
        self.isFinished = isFinished
    }
}
