//
//  ItemListSingleton.swift
//  FinalProjectDemo
//
//  Created by Mourya on 5/9/17.
//  Copyright © 2017 Mourya. All rights reserved.
//

import Foundation

class Singleton: NSObject {
    static let sharedUserID = Singleton()
    var userID : String = ""
}
