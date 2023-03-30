//
//  DoneView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/30.
//

import Foundation
import SwiftUI


// MARK: ContentView 칸반생성시 BacklogView 업데이트가 되지않는 이슈
struct DoneView: View {
    
    @StateObject var canvanController:CanvanController
    @State private var showingAlert:Bool = false
    var body: some View {
        NavigationView {
            VStack{
                ForEach(0..<canvanController.doneCanvans.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: canvanController.doneCanvans[index])
                    } label: {
                        Text(canvanController.doneCanvans[index].title)
                    }

                }
            }
            .navigationTitle("DoneView")
        }
    }
}
