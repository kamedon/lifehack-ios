//
//  Todo.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

struct TodoData {
    var body: String = ""
    var state: Todo.State = Todo.State.ISSUE
}

class Todo : Object{
    enum State : String {
        case ISSUE = "issue"
        case PROGRESS = "progress"
        case DONE = "done"
    }
    
    dynamic var id: String = UUID().uuidString
    dynamic var body: String = ""
    dynamic var state: String = State.ISSUE.rawValue
    
    var stateAsEnum : State {
        get {
            return State(rawValue: state)!
        }
        set {
            state = newValue.rawValue
        }
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    override static func indexedProperties() -> [String] {
        return ["state"]
    }
}
