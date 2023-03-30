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
    @State var showingAlert:Bool = false
    @StateObject var canvanController:CanvanController = CanvanController()

    var body: some View {
        NavigationView {
            ScrollView {
                BacklogView(canvanController: canvanController)
                    .aspectRatio( contentMode: .fit)
                InProgressView(canvanController: canvanController)
                    .aspectRatio( contentMode: .fit)
                DoneView(canvanController: canvanController)
                    .aspectRatio( contentMode: .fit)
        }
            .toolbar {
                ToolbarItem(id: "Add", placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }.alert("제목", isPresented: $showingAlert) {
                        TextField("제목", text: $canvanController.canvanTitle)
                        TextField("내용", text: $canvanController.canvanDescription)
                        Button ("칸반추가") {
                            let newCanvan = Canvan(title: canvanController.canvanTitle, description: canvanController.canvanDescription, priority: 1,field: .BackLog, date: Date())
                            canvanController.addCanvan(canvan: newCanvan)
                        }
                        Button("취소") {
                            canvanController.canvanTitle = ""
                            canvanController.canvanDescription = ""
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



//// 방법 1 ZStack 을 이용해서 2개의뷰를 만들기
//ScrollView {
//    ZStack {
//        VStack{
//            BacklogView(viewModel: viewModel)
//                .border(.black)
//            InProgressView(viewModel: viewModel)
//                .border(.green)
//        }
//        VStack {
//            Text("Canvan")
//                .position(circlePosition)
//                .gesture(
//                DragGesture()
//                    .onChanged({ value in
//                        self.circlePosition = value.location
//                    }))
//            Button("Boundary Chekck") {
//                print(circlePosition)
//            }
//        }
//    }
//}


//방법2 각뷰의 하나의 컨트롤러로 모든걸 관리할수있는 컨트롤러 공통으로 사용하기 각 하위뷰에서 칸반생성및 넘겨주기가능
