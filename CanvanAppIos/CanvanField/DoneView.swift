//
//  DoneView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/30.
//

import Foundation
import SwiftUI


struct DoneView: View {
    
    @StateObject var canvanController:CanvanController
    @State var newTitle:String = ""
    @State var newDescription:String = ""
    @State var canvanIsSelected:Bool = false
    @State var showingAlert:Bool = false
    
    var body: some View {
        NavigationView {
            VStack(){
                ScrollView{
                    ForEach(0..<canvanController.DoneCanvans().count, id: \.self) {
                        index in
                        HStack {
                            Text(canvanController.DoneCanvans()[index].title)
                                .bold()
                            NavigationLink {
                                CanvanDetailView(canvan: canvanController.DoneCanvans()[index], canvanController: canvanController)
                            } label: {
                                Image(systemName: "info.bubble")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(canvanController.DoneCanvans()[index].isSelected ? .cyan : .gray)
                        .border(canvanController.DoneCanvans()[index].isSelected ? .cyan : .gray , width: 2)
                        .foregroundColor(canvanController.DoneCanvans()[index].priority == 0 ? .black : .red)
                        .cornerRadius(10)
                        .aspectRatio(1.0,contentMode: .fit)
                        .onTapGesture {
                            if canvanController.index != nil {
                                canvanController.canvanItems[self.canvanController.index!].isSelected = false
                            }
                            canvanController.setCanvan(canvanController.DoneCanvans()[index].id)
                            canvanController.canvanItems[self.canvanController.index!].isSelected = true
                            print(canvanController.index!)
                        }
                    }
                }
            }
            .navigationTitle("Done")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "Add", placement: .bottomBar) {
                    HStack {
                        Button("Previous") {
                            canvanController.previousCanvan()
                        }
                    }
                }
            }
        }
    }
}
