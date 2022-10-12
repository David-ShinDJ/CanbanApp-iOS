//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct ContentView: View {
    @EnvironmentObject var contentViewModel:ContentViewModel
    @State private var showingSheet = false
    @State private var doneCanvan = false
    
    let columns = [GridItem(.flexible())]
    var body: some View {NavigationView {
        ScrollView {
            HStack{
                doneCanvan ? Text(contentViewModel.canvanModel.canvanName).font(.body) : Text("CanvanEmpty").font(.body)
                Spacer()
            }
            LazyVGrid(columns: columns,alignment: .center, content: {
                ForEach(0...Int(contentViewModel.canvanModel.canvanNumber.rawValue), id: \.self) { index in
                    if contentViewModel.canvanModel.canvanNumber.rawValue == 0 {
                        Text("Make Canvan")
                    } else {
                        CanvanListView()
                    }
                }
            })
        }
        .navigationTitle("CanvanApp")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem (placement:.navigationBarTrailing){
                Button("New") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    CanvanModalView(doneCanvan:$doneCanvan)
                        .presentationDetents([.medium]) //MARK: PopUp Modal Center 생성 변경필요!
                }
            }
        }
    }
    }
}

struct CanvanModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var contentViewModel:ContentViewModel
    @Binding var doneCanvan:Bool
    
    enum CanvanNumber: Int, Identifiable {
        case One, Two, Three, Four, Five, Six, Seven, Eight, Nine
        var id: Self { self }
    }
    
    enum CanvanTheme: String, Identifiable {
        case Red, Orange, Yellow, Green, Blue ,Indigo, Purple
        var id: Self { self }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button("Done") {
                    self.presentationMode.wrappedValue.dismiss()
                    doneCanvan = true
                }
                .disabled(contentViewModel.canvanModel.canvanName.isEmpty)
                Spacer()
                Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            HStack {
                Text("Name :")
                TextField(text: $contentViewModel.canvanModel.canvanName) {
                    Text("Name")
                }
            }
            HStack{
                Text("Cloumns :")
                Picker("Columns", selection: $contentViewModel.canvanModel.canvanNumber) {
                    Text("1").tag(CanvanModel.CanvanNumber.One)
                    Text("2").tag(CanvanModel.CanvanNumber.Two)
                    Text("3").tag(CanvanModel.CanvanNumber.Three)
                    Text("4").tag(CanvanModel.CanvanNumber.Four)
                    Text("5").tag(CanvanModel.CanvanNumber.Five)
                    Text("6").tag(CanvanModel.CanvanNumber.Six)
                    Text("7").tag(CanvanModel.CanvanNumber.Seven)
                    Text("8").tag(CanvanModel.CanvanNumber.Eight)
                    Text("9").tag(CanvanModel.CanvanNumber.Nine)
                }
            }
            HStack{
                Text("Theme :")
                Picker("Theme", selection: $contentViewModel.canvanModel.canvanTheme) {
                    Text("Red").tag(CanvanModel.CanvanTheme.Red)
                    Text("Orange").tag(CanvanModel.CanvanTheme.Orange)
                    Text("Yellow").tag(CanvanModel.CanvanTheme.Yellow)
                    Text("Green").tag(CanvanModel.CanvanTheme.Green)
                    Text("Blue").tag(CanvanModel.CanvanTheme.Blue)
                    Text("Indigo").tag(CanvanModel.CanvanTheme.Indigo)
                    Text("Purple").tag(CanvanModel.CanvanTheme.Purple)
                }
            }
        }.padding()
    }
}


struct CanvanItem: Identifiable {
    var id: String { list }
    let list: String
}
struct CanvanListView: View {
    @EnvironmentObject var contentViewModel:ContentViewModel
    
    @State var canvanTitle:String = "Title"
    @State var canvanList:String = ""
    @State var canvanLists:[String] = []
    @State var textEditorHeight:Double = 20.0
    @State var textEditorPressed:Bool = true
    
    @State var isPresented:Bool = false
    
    @State var addCanvanList:CanvanItem?
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack(alignment: .center){
                    Button {
                        textEditorPressed = false
                        print("Hello")
                    } label: {
                        Image(systemName: "pencil.circle.fill").resizable()
                            .frame(width:30, height:30)
                    }
                    TextEditor(text: $canvanTitle).disabled(textEditorPressed).font(.title).frame(height:max(40,20))

                }
                LazyVGrid(columns: columns) {
                    ForEach(0..<canvanLists.count,id:\.self) { index in
                        Text(canvanLists[index])
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        addCanvanList = CanvanItem(list: "Hello")
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }.alert("List", isPresented: $isPresented, actions: {
                        TextField("List", text: $canvanList)
                        Button("Ok", action: {
                            canvanLists.append(canvanList)
                            canvanList = ""
                            print(canvanLists)
                        })
                        Button("Cancel", role: .cancel, action: {
            
                        })
                    }, message: {
                        Text("Write List")
                    })

                }
            }
        }
    }
}
