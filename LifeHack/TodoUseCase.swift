//
//  TodoUseCase.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

class TodoUseCase {
    let repository : TodoRepositoryProtocol
    
    init(repository: TodoRepositoryProtocol) {
        self.repository = repository
    }
    
    func all() -> Results<Todo> {
        return repository.all()
    }
    
    func update(_ todo: Todo,data: TodoData) {
        repository.update(todo, data: data)
    }
    
    func insert(_ todo: TodoData) {
        repository.insert(todo)
    }
    
    func delete(_ todo: Todo) {
        repository.delete(todo)
    }
    
    
}
