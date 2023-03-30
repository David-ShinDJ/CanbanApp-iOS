//
//  CanvanModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/08.
//
import SwiftUI
import Foundation

class Canvan: Identifiable {
    
    enum Field: String {
        case BackLog
        case InProgree
        case Done
    }
    
    let title: String
    let description: String
    var priority: Int
    var field: Field
    let date: Date
    
    init(title:String, description:String, priority:Int, field:Field, date:Date) {
        self.title = title
        self.description = description
        self.priority = priority
        self.field = field
        self.date = date
    }

}
