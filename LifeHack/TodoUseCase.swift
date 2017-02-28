//
//  TodoUseCase.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation

class TodoUseCase {
    let repository : TodoRepositoryProtocol
    
    init(repository: TodoRepositoryProtocol) {
        self.repository = repository
    }
    
    func list() -> [Todo] {
        return repository.all()
    }
    
    func save(_ todo: Todo) {
        repository.save(todo)
    }
    
}
