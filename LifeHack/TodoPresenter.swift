//
//  TodoPresenter.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

protocol TodoView {
}

class TodoPresenter: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var tableView: UITableView!
    
    let useCase: TodoUseCase
    let view : TodoView
    
    var todoList : Results<Todo>!
    
    init(view: TodoView,useCase: TodoUseCase) {
        self.useCase = useCase
        self.view = view
    }
    
    func bind(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func load() {
        todoList = useCase.all()
        tableView.reloadData()
    }
    
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count+1
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableCell
        
        let index = indexPath.row - 1
        let isFirst = index == -1
        let todo = isFirst ? Todo() : todoList[index]
        cell.bodyText.text = todo.body
        if isFirst {
            cell.btnComplete.isHidden = true
        }
        cell.onComplete = { sender in
            self.useCase.delete(todo)
            self.load()
        }
        cell.onBodyEditingDidEnd = { sender in
            let data = TodoData(body: sender.text!, state: todo.stateAsEnum)
            if isFirst {
                self.useCase.insert(data)
                self.load()
            }else{
                self.useCase.update(todo, data: data)
            }
            
        }
        return cell
    }
}

