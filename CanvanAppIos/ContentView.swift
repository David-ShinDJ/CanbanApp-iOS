//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import Foundation
import UniformTypeIdentifiers

// CanvanField 같은 칸반 모델을 공유하고 그 모델은 Type 존재해서 칸반을 이동시킬떄 타입이 변경된다

struct ContentView: View {
    @StateObject var canvanController:CanvanController = CanvanController()
    @State var newTitle:String = ""
    @State var newDescription:String = ""
    @State var showingAlert:Bool = false
    var body: some View {
        NavigationView {
            VStack {
                    BacklogView(canvanController: canvanController)
                        .navigationBarTitleDisplayMode(.inline)
                    InProgressView(canvanController: canvanController)
                        .navigationBarTitleDisplayMode(.inline)
                    DoneView(canvanController: canvanController)
                        .navigationBarTitleDisplayMode(.inline)
            }.toolbar {
                ToolbarItem(id: "Add", placement: .navigationBarTrailing) {
                    Button("+ 칸반추가") {
                        showingAlert = true
                    }.alert("Title", isPresented: $showingAlert) {
                        TextField("TitleField", text: $newTitle)
                        TextField("DescriptionField", text: $newDescription)
                        Button("칸반생성") {
                            canvanController.createCanvan(title: self.newTitle, description: self.newDescription, field: .Backlog)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//MARK: 각뷰의 하나의 컨트롤러로 모든걸 관리할수있는 컨트롤러 공통으로 사용하기 각 하위뷰에서 칸반생성및 넘겨주기가능
