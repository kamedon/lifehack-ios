//
//  TodoView.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/02/27.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import UIKit

class TodoTableCell: UITableViewCell {
    
    @IBOutlet weak var bodyText: UITextField!
    
    @IBOutlet weak var btnComplete: UIButton!
    
    var onComplete: ((UIButton) -> ())?
    
    var onBodyEditingDidEnd: ((UITextField) -> ())?
    
    @IBAction func tappedComplete(_ sender: UIButton) {
        if(onComplete != nil){
            onComplete?(sender)
        }
    }
    
    @IBAction func bodyEditingDidEnd(_ sender: UITextField) {
        if(onBodyEditingDidEnd != nil) {
            onBodyEditingDidEnd?(sender)
        }
    }
}
