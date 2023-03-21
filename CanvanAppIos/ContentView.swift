//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import Foundation
import UniformTypeIdentifiers

let canvanSample:Canvan = Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())
let canvanSamples:[Canvan] = [
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date()),
    Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())
]
struct ContentView: View {
    
    @State var showingAlert:Bool = false
    
    @StateObject var viewModel:ContentViewModel = ContentViewModel()
    @State private var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(0..<viewModel.canvanItems.count, id: \.self) {
                    index in
                    NavigationLink {
                        CanvanDetailView(canvan: viewModel.canvanItems[index])
                    } label: {
                        HStack {
                            Text(viewModel.canvanItems[index].title)
                            Spacer()
                            Text("\(viewModel.canvanItems[index].priority)")
                        }
                        .background(.blue)
                        .offset(offset)
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
