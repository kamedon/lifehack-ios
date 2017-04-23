//
//  CategoryUseCase.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/04/23.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryUseCase {
    let repository : CategoryRepositoryProtocol
    
    init(repository: CategoryRepositoryProtocol) {
        self.repository = repository
    }
    
    func all() -> Results<Category> {
        return repository.all()
    }
    
    func update(_ catagory: Category,data: CategoryData) {
        repository.update(catagory, data: data)
    }
    
    func insert(_ catagory: CategoryData) {
        repository.insert(catagory)
    }
    
    func delete(_ catagory: Category) {
        repository.delete(catagory)
    }
    
    
}
