//
//  BacklogView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI


// MARK: ContentView 칸반생성시 BacklogView 업데이트가 되지않는 이슈 
struct BacklogView: View {
    @StateObject var viewModel:ContentViewModel
    @State private var offset = CGSize.zero
    @State private var canvans:[Canvan] = []
    
    var body: some View {
        NavigationView {
            VStack{
                Text("BackLog")
                ForEach(0..<canvans.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: canvans[index])
                    } label: {
                        HStack {
                            Text(canvans[index].title)
                            Spacer()
                            Text("\(canvans[index].priority)")
                        }.offset(offset)
                            .gesture(
                              DragGesture()
                                .onChanged { gesture in
                                  offset = gesture.translation
                                }
                                .onEnded { gesture in
                                  offset = .zero
                                }
                            )
                    }
                    
                }
            }
            .onAppear {
                self.canvans = viewModel.backlogItems
            }
        }
    }
}