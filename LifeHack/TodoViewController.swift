//
//  TodoViewController.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, TodoView {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter : TodoPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TodoPresenter(view: self, useCase: TodoUseCase(repository: TodoRepository()))
        presenter.bind(tableView)
        presenter.load()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
