//
//  CategoryViewController.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/04/23.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, CategoryView {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : CategoryPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CategoryPresenter(view: self, useCase: CategoryUseCase(repository: CategoryRepository()))
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
