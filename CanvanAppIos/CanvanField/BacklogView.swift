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
    
    var body: some View {
        NavigationView {
            VStack(){
                ScrollView{
                    ForEach(0..<canvanController.backlogCanvans().count, id: \.self) {
                        index in
                        HStack {
                            Text(canvanController.backlogCanvans()[index].title)
                                .bold()
                            NavigationLink {
                                CanvanDetailView(canvan: canvanController.backlogCanvans()[index], canvanController: canvanController)
                            } label: {
                                Image(systemName: "info.bubble")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(canvanController.backlogCanvans()[index].isSelected ? .cyan : .gray)
                        .border(canvanController.backlogCanvans()[index].isSelected ? .cyan : .gray , width: 2)
                        .foregroundColor(canvanController.backlogCanvans()[index].priority == 0 ? .black : .red)
                        .cornerRadius(10)
                        .aspectRatio(1.0,contentMode: .fit)
                        .onTapGesture {
                            if canvanController.index != nil {
                                canvanController.canvanItems[self.canvanController.index!].isSelected = false
                            }
                            canvanController.setCanvan(canvanController.backlogCanvans()[index].id)
                            canvanController.canvanItems[self.canvanController.index!].isSelected = true
                            print(canvanController.index!)
                        }
                    }
                }
            }
            .onAppear {
                canvanController.index = nil
            }
            .navigationTitle("BackLog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "CanvanOption", placement: .bottomBar) {
                        Button("Next") {
                            canvanController.nextCanvan()
                        }
                    }
                }
            }
        }
    }

