//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import Foundation
import UniformTypeIdentifiers

enum AddType: String {
    case BackLog
    case UpNext
    case InProgress
    case OnHold
    case Done
}

let canvanSample:Canvan = Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())
let canvanSamples:[Canvan] = [
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())
]
struct ContentView: View {
    @State var addType:AddType = .BackLog
    @State var showingAlert:Bool = false
    @StateObject var viewModel:ContentViewModel = ContentViewModel()
    @State private var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            ScrollView {
                BacklogView(viewModel: viewModel)
                    .frame(maxHeight:200)
                    .border(.red)
                    .onTapGesture {
                        
                    }
                UpNextView(viewModel: viewModel)
                    .frame(maxHeight:200)
                    .border(.orange)
                InProgressView(viewModel: viewModel)
                    .frame(maxHeight:200)
                    .border(.yellow)
                OnHoldView(viewModel: viewModel)
                    .frame(maxHeight:200)
                    .border(.green)
                DoneView(viewModel: viewModel)
                    .frame(maxHeight:200)
                    .border(.blue)
            }
            .toolbar {
                ToolbarItem(id:"addCanvan", placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAlert = true
                    }.alert("Title", isPresented: $showingAlert, actions: {
                        // Any view other than Button would be ignored
                        TextField("TitleField", text: $viewModel.canvanTitle)
                        TextField("DesciprtionField", text:$viewModel.canvanDescription)
                        Button("칸반생성") {
                            let newCanvan = Canvan(title: viewModel.canvanTitle, description: viewModel.canvanDescription, priority: 1, date: Date())
                            viewModel.addCanvan(canvan: newCanvan)
                        }
                        Button("취소") {
                            
                        }
                    }, message: {
                        // Any view other than Text would be ignored
                    })
                }
            }
        }
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
