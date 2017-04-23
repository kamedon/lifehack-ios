//
//  CategoryPresenter.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/04/23.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol CategoryView {
}

class CategoryPresenter: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var tableView: UITableView!
    
    let useCase: CategoryUseCase
    let view : CategoryView
    
    var catagoryList : Results<Category>!
    
    init(view: CategoryView,useCase: CategoryUseCase) {
        self.useCase = useCase
        self.view = view
    }
    
    func bind(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func load() {
        catagoryList = useCase.all()
        tableView.reloadData()
    }
    
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryList.count+1
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableCell
//
//        let index = indexPath.row - 1
//        let isFirst = index == -1
//        let category = isFirst ? Category() : catagoryList[index]
//        cell.bodyText.text = todo.body
//        if isFirst {
//            cell.btnComplete.isHidden = true
//        }
//        cell.onComplete = { sender in
//            self.useCase.update(todo, data: TodoData(body: cell.bodyText.text!, state: Todo.State.DONE))
//            self.load()
//        }
//        cell.onBodyDidEndOnExit = { sender in
//            let data = TodoData(body: sender.text!, state: todo.stateAsEnum)
//            if isFirst {
//                self.useCase.insert(data)
//                self.load()
//            }else{
//                self.useCase.update(todo, data: data)
//            }
//            
//        }
        return cell
    }
}
