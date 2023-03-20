//
//  CanvanModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/08.
//
import SwiftUI
import Foundation
class CanvanModel {
    var canvanName: String
    var canvanNumber: CanvanNumber
    var canvanTheme:CanvanTheme
    
    init(canvanName: String, canvanNumber: CanvanNumber, canvanTheme: CanvanTheme) {
        self.canvanName = canvanName
        self.canvanNumber = canvanNumber
        self.canvanTheme = canvanTheme
    }
        
    enum CanvanNumber: Int, Identifiable {
        case One, Two, Three, Four, Five, Six, Seven, Eight, Nine
        var id: Self { self }
    }
    
    enum CanvanTheme: String, Identifiable {
        case Red, Orange, Yellow, Green, Blue ,Indigo, Purple
        var id: Self { self }
    }
}




class Canvan {
    
    let title: String
    let description: String
    var priority: Int
    let date: Date
    
    init(title:String, description:String, priority:Int, date:Date) {
        self.title = title
        self.description = description
        self.priority = priority
        self.date = date
    }

}
