//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers


struct ContentView: View {
    @State var searchText:String = "Search"
    @EnvironmentObject var canvanModel:CanvanModel
    @State private var showingSheet = false
    var body: some View {NavigationView {
        ScrollView {
            HStack{
                Text(canvanModel.canvanName)
                    .font(.body)
                    .opacity(0.5)
                Spacer()
            }
        }
        .navigationTitle("CanvanApp")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem (placement:.navigationBarTrailing){
                Button("New") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    CanvanModalView()
                        .presentationDetents([.medium]) //MARK: PopUp Modal Center 생성 변경필요!
                }
            }
            
        }
        .searchable(text: $searchText,
                    placement: .sidebar)
    }
        
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct CanvanModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var canvanModel:CanvanModel
    
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
                        canvanModel.printCanvanValue()
                    }
                    .disabled(canvanModel.canvanName.isEmpty)
                    Spacer()
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
                HStack {
                    Text("Name :")
                    TextField(text: $canvanModel.canvanName) {
                        Text("Name")
                    }
                }
                HStack{
                    Text("Cloumns :")
                    Picker("Columns", selection: $canvanModel.canvanColums) {
                        Text("1").tag(CanvanNumber.One)
                        Text("2").tag(CanvanNumber.Two)
                        Text("3").tag(CanvanNumber.Three)
                        Text("4").tag(CanvanNumber.Four)
                        Text("5").tag(CanvanNumber.Five)
                        Text("6").tag(CanvanNumber.Six)
                        Text("7").tag(CanvanNumber.Seven)
                        Text("8").tag(CanvanNumber.Eight)
                        Text("9").tag(CanvanNumber.Nine)
                    }
                }
                HStack{
                    Text("Theme :")
                    Picker("Theme", selection: $canvanModel.canvanTheme) {
                        Text("Red").tag(CanvanTheme.Red)
                        Text("Orange").tag(CanvanTheme.Orange)
                        Text("Yellow").tag(CanvanTheme.Yellow)
                        Text("Green").tag(CanvanTheme.Green)
                        Text("Blue").tag(CanvanTheme.Blue)
                        Text("Indigo").tag(CanvanTheme.Indigo)
                        Text("Purple").tag(CanvanTheme.Purple)
                    }
                }
        }.padding()
        
    }
}

// CanvanView GeometryReader 사용하기
//struct RightView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            Rectangle()
//                .path(in: CGRect(x: geometry.size.width/2, y: 0,
//                                width: geometry.size.width / 2.0,
//                                height: geometry.size.height / 2.0))
//                .fill(Color.blue)
//        }
//    }
//}


class CanvanModel: ObservableObject {
    
    enum CanvanNumber: Int, Identifiable {
        case One, Two, Three, Four, Five, Six, Seven, Eight, Nine
        var id: Self { self }
    }
    
    enum CanvanTheme: String, Identifiable {
        case Red, Orange, Yellow, Green, Blue ,Indigo, Purple
        var id: Self { self }
    }
    
    @State private var canvanColumns:CanvanNumber = .One
    @State private var canvanThemes:CanvanTheme = .Blue
    @Published var canvanName:String = "Please Make a Canvan"
    @Published var canvanColums:CanvanNumber = .One
    @Published var canvanTheme:CanvanTheme = .Red
    @Published var canvans:Canvan?
    
    func printCanvanValue() {
        print(self.canvanName, self.canvanColums, self.canvanTheme, self.canvans)
    }
}

class Canvan {
    let canvanTItle:String
    var canvanList:[String]
    
    init(canvanTItle: String, canvanList: [String]) {
        self.canvanTItle = canvanTItle
        self.canvanList = canvanList
    }
    
}
