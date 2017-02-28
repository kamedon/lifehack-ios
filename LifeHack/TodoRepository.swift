//
//  TodoRepository.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation

protocol TodoRepositoryProtocol {
    func all() -> [Todo]
    func save(_ todo: Todo)
}

class TodoRepository  : TodoRepositoryProtocol{
    func all() -> [Todo] {
        return [Todo(body: "bodybodybody"),Todo(body: "bodybodybody")]
    }
    
    func save(_ todo: Todo) {
    }
}
