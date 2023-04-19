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
    @State var newTitle:String = ""
    @State var newDescription:String = ""
    @State var canvanIsSelected:Bool = false
    @State var showingAlert:Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    ForEach(0..<canvanController.inprogressCanvans().count, id: \.self) {
                        index in
                        NavigationLink {
                            CanvanDetailView(canvan: canvanController.inprogressCanvans()[index], canvanController: canvanController)
                        } label: {
                            HStack(alignment: .center) {
                                Text(canvanController.inprogressCanvans()[index].title)
                                Spacer()
                                Text("\(canvanController.inprogressCanvans()[index].priority)")
                        }
                    }
                }
                }
            }
            .navigationTitle("InProgress")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "Add", placement: .bottomBar) {
                    Button("+ InProgress 추가하기") {
                        showingAlert = true
                    }.alert("Title", isPresented: $showingAlert) {
                        TextField("TitleField", text: $newTitle)
                        TextField("DescriptionField", text: $newDescription)
                        Button("칸반생성") {
                            canvanController.createCanvan(title: self.newTitle, description: self.newDescription, field: .Inprogress)
                            newTitle = ""
                            newDescription = ""
                        }
                        Button("취소") {
                            print("취소눌러짐")
                        }
                    }
                }
            }
        }
    }
}
