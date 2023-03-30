//
//  BacklogView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI
let canvanSample = Canvan(title: "Hello", description: "Heloo My Name is", priority: 1, field: .BackLog, date: Date())

// MARK: ContentView 칸반생성시 BacklogView 업데이트가 되지않는 이슈 
struct BacklogView: View {
    
    @StateObject var canvanController:CanvanController
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                ForEach(0..<canvanController.backlogCanvans.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: canvanController.backlogCanvans[index])
                    } label: {
                        Text(canvanController.backlogCanvans[index].title)
                    }
                    .onLongPressGesture(perform: {
                        
                    })
                    .background(.black)

                }
            }
            .navigationTitle("BackLogView")
        }
    }
}
