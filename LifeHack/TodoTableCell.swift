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
    
    var onBodyDidEndOnExit: ((UITextField) -> ())?
    
    @IBAction func tappedComplete(_ sender: UIButton) {
        onComplete?(sender)
    }
    
    @IBAction func bodyDidEndOnExit(_ sender: UITextField) {
        onBodyDidEndOnExit?(sender)
    }
}
