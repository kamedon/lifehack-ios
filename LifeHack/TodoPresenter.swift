//
//  TodoPresenter.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import UIKit

protocol TodoView {
}

class TodoPresenter: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var tableView: UITableView!
    
    let useCase: TodoUseCase
    let view : TodoView
    
    var todoList : [Todo] = []
    
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
        todoList = useCase.list()
        todoList.insert(Todo(body: ""), at: 0)
        tableView.reloadData()
    }
    
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableCell
        var todo = todoList[indexPath.row]
       
        cell.bodyText.text = todo.body
        cell.onComplete = { sender in
            self.todoList.remove(at: indexPath.row)
            table.reloadData()
        }
        cell.onBodyEditingDidEnd = { sender in
            todo.body = sender.text!
            self.useCase.save(todo)
        }
        return cell
    }
}

