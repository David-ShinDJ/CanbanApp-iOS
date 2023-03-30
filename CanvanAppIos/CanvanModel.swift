//
//  CanvanModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/08.
//
import SwiftUI
import Foundation

class Canvan: Identifiable {
    
    
    let title: String
    let description: String
    var priority: Int
    var canvanType: AddType
    let date: Date
    
    init(title:String, description:String, priority:Int, date:Date) {
        self.title = title
        self.description = description
        self.priority = priority
        self.canvanType = .BackLog
        print(self.canvanType.rawValue)
        self.date = date
    }

}
