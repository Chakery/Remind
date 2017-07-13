//
//  ItemModel.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Foundation

enum Birthday {
    case gregorian(Date)
    case lunar(Date)
}

struct NoteModel {
    var username: String
    var birthday: Birthday?
}
