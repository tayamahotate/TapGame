//
//  UserData.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/18.
//  Copyright © 2015年 yuri. All rights reserved.
//

import Foundation
import RealmSwift

class UserData: Object {
    dynamic var id = 1
    dynamic var username: String = ""
    dynamic var startdate = NSDate(timeIntervalSince1970: 1)
    dynamic var logindate = NSDate(timeIntervalSince1970: 1)

    override static func primaryKey() -> String? {
        return "id"
    }
}
