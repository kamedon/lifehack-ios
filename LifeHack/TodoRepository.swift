//
//  TodoRepository.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

protocol TodoRepositoryProtocol {
    func all() -> Results<Todo>
    func insert(_ data: TodoData)
    func update(_ todo: Todo,data: TodoData)
    func delete(_ todo: Todo)
}

class TodoRepository  : TodoRepositoryProtocol{
    func all() -> Results<Todo> {
        let realm = try! Realm()
        return realm.objects(Todo.self)
    }
    
    func insert(_ data: TodoData) {
        let realm = try! Realm()
        try! realm.write {
            realm.create(Todo.self, value: ["body": data.body, "state": data.state.rawValue])
        }
    }
    
    func update(_ todo: Todo, data: TodoData)  {
        let realm = try! Realm()
        try! realm.write {
            todo.body = data.body
            todo.stateAsEnum = data.state
            realm.add(todo, update: true)
        }
    }
    
    func delete(_ todo: Todo) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todo)
        }
    }
    
}
