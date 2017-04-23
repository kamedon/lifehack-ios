//
//  CategoryRepository.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/04/23.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

protocol CategoryRepositoryProtocol {
    func all() -> Results<Category>
    func insert(_ data: CategoryData)
    func update(_ category: Category,data: CategoryData)
    func delete(_ category: Category)
}

class CategoryRepository: CategoryRepositoryProtocol{
    func all() -> Results<Category> {
        let realm = try! Realm()
        return realm.objects(Category.self)
    }
    
    func insert(_ data: CategoryData) {
        realm{ realm in
            realm.create(Category.self, value: ["name": data.name])
        }
    }
    
    func update(_ category: Category, data: CategoryData)  {
        realm { realm in
            category.name = data.name
            realm.add(category, update: true)
        }
    }
    
    func delete(_ category: Category) {
        realm{ realm in
            realm.delete(category)
        }
    }
    
    private func realm(_ run: (Realm) -> Void) {
        let realm = try! Realm()
        try! realm.write {
            run(realm)
        }
    }
}
