//
//  CanvanBoard.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/29.
//

import Foundation


class CanvanBoard: Identifiable{
    
    let title:String
    let lists:[String]
    
    init(title: String, lists: [String]) {
        self.title = title
        self.lists = lists
    }
}


class CanvanBoardManager {
    
    var canvans:[CanvanBoard] = []
    
    func addCanvan(title:String, lists:[String]) {
        canvans.append(CanvanBoard(title: title, lists: lists))
    }
    
}
