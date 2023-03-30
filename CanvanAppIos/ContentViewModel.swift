//
//  ContentViewModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/11.
//

import Foundation
class ContentViewModel: ObservableObject {
    
    @Published var canvanItems:[Canvan] = []
    @Published var canvanTitle:String = ""
    @Published var canvanDescription:String = ""
    var backlogItems:[Canvan] {
        canvanItems.filter { canvan in
            canvan.canvanType.rawValue == "BackLog"
        }
    }
    
    func addCanvan(canvan:Canvan) {
        canvanItems.append(canvan)
    }
    
    func categorizedCanvan(_ canvanType:String) -> [Canvan] {
        self.canvanItems.filter { canvan in
            canvan.canvanType.rawValue == canvanType
        }
    }
}


