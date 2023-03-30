//
//  DoneView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/24.
//

import Foundation
import SwiftUI

struct DoneView: View {
    @StateObject var viewModel:ContentViewModel
    @State private var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            VStack{
                Text("DoneView")
                ForEach(0..<viewModel.canvanItems.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: viewModel.canvanItems[index])
                    } label: {
                        HStack {
                            Text(viewModel.canvanItems[index].title)
                            Spacer()
                            Text("\(viewModel.canvanItems[index].priority)")
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
        }
    }
}
