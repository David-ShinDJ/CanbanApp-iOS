//
//  ContentViewModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/11.
//

import Foundation
class CanvanController: ObservableObject {
    
    @Published var canvanItems:[Canvan] = []
    @Published var selectedCanvan:Canvan? = nil
    @Published var canvanTitle:String = ""
    @Published var canvanDescription:String = ""
    
    func addCanvan(canvan:Canvan) {
        canvanItems.append(canvan)
    }
    var backlogCanvans: [Canvan] {
        canvanItems.filter { Canvan in
            Canvan.field == .BackLog
        }
    }
    var inprogressCanvans: [Canvan] {
        canvanItems.filter { Canvan in
            Canvan.field == .InProgree
        }
    }
    
    var doneCanvans:[Canvan] {
        canvanItems.filter { Canvan in
            Canvan.field == .Done
        }
    }
    
    func selectCanvan(_ canvan:Canvan) {
        self.selectedCanvan = canvan
    }
    
    func nextFieldCanvan() {
        if self.selectedCanvan?.field == .BackLog {
            self.selectedCanvan?.field = .InProgree
        } else if self.selectedCanvan?.field == .InProgree {
            self.selectedCanvan?.field = .Done
        } else {
            self.selectedCanvan?.field = .Done
        }
    }
}


