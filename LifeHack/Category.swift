//
//  Category.swift
//  LifeHack
//
//  Created by kamei.hidetoshi on 2017/04/23.
//  Copyright © 2017年 kamedon. All rights reserved.
//

import Foundation
import RealmSwift

struct CategoryData {
    var name: String = ""
}

class Category : Object{
    var name: String = "none"
}
