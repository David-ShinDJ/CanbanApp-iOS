//
//  BacklogView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI
// 단일 View 에서 Controller 사용해서 CRUD 작성하기
// App 규모가 크지않고 공통된 기능이 있으므로 MVC 패턴을사용하자!
// Controller CRUD 전부 구현후 어떻게 구현할지 Array Index 사용하지 OR ?

struct BacklogView: View {
    
    @StateObject var canvanController:CanvanController
    @State var newTitle:String = ""
    @State var newDescription:String = ""
    @State var canvanIsSelected:Bool = false
    @State var showingAlert:Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                ForEach(0..<canvanController.canvanItems.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: canvanController.canvanItems[index], canvanController: canvanController)
                    } label: {
                        HStack(alignment: .center) {
                            Text(canvanController.canvanItems[index].title)
                            Text("\(canvanController.canvanItems[index].priority)")
                        }
                    }
                }
            }.toolbar {
                ToolbarItem(id: "Add", placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAlert = true
                    }.alert("Title", isPresented: $showingAlert) {
                        TextField("TitleField", text: $newTitle)
                        TextField("DescriptionField", text: $newDescription)
                        Button("칸반생성") {
                            canvanController.createCanvan(title: self.newTitle, description: self.newDescription)
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


struct BacklogView_Previews: PreviewProvider {
    @StateObject static var staticCanvanController:CanvanController = CanvanController()
    static var previews: some View {
        BacklogView(canvanController:staticCanvanController )
    }
}
