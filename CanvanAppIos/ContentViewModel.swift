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
    
    func addCanvan(canvan:Canvan) {
        canvanItems.append(canvan)
    }
}


