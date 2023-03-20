//
//  ContentViewModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/11.
//

import Foundation
class ContentViewModel: ObservableObject {
    
    @Published var canvanModel:CanvanModel = CanvanModel(canvanName: "MakeCanvanName", canvanNumber: .One, canvanTheme: .Red)
    
    func printCanvanValue() {
        print(self.canvanModel.canvanNumber, self.canvanModel.canvanTheme)
    }
}


