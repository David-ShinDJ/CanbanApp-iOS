//
//  InProgressView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI


struct InProgressView: View {
    
    @StateObject var canvanController:CanvanController
    
    var body: some View {
        NavigationView {
            VStack(){
                ScrollView{
                    ForEach(0..<canvanController.inprogressCanvans().count, id: \.self) {
                        index in
                        HStack {
                            Text(canvanController.inprogressCanvans()[index].title)
                                .bold()
                            NavigationLink {
                                CanvanDetailView(canvan: canvanController.inprogressCanvans()[index], canvanController: canvanController)
                            } label: {
                                Image(systemName: "info.bubble")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(canvanController.inprogressCanvans()[index].isSelected ? .cyan : .gray)
                        .border(canvanController.inprogressCanvans()[index].isSelected ? .cyan : .gray , width: 2)
                        .foregroundColor(canvanController.inprogressCanvans()[index].priority == 0 ? .black : .red)
                        .cornerRadius(10)
                        .aspectRatio(1.0,contentMode: .fit)
                        .onTapGesture {
                            if canvanController.index != nil {
                                canvanController.canvanItems[self.canvanController.index!].isSelected = false
                            }
                            canvanController.setCanvan(canvanController.inprogressCanvans()[index].id)
                            canvanController.canvanItems[self.canvanController.index!].isSelected = true
                            print(canvanController.index!)
                        }
                    }
                }
            }
            .navigationTitle("InProgress")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "CanvanOption", placement: .bottomBar) {
                    HStack {
                        Button("Previous") {
                            canvanController.previousCanvan()
                        }
                        Button("Next") {
                            canvanController.nextCanvan()
                        }
                    }
                }
            }
        }
    }
}
