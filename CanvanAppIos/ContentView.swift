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
    enum Field: Hashable {
            case first
            case second
        }

    @State var canvanTitle:String = "칸반제목"
    @FocusState private var focusedField: Field?
    
    let columns = [
        GridItem(),
        ]
    
    @State var canvanboards:[CanvanBoard] = [
        CanvanBoard(title: "Title1", lists: ["list", "list2", "list3"]),
        CanvanBoard(title: "Title2", lists: ["list", "list2", "list3"]),
        CanvanBoard(title: "Title3", lists: ["list", "list2", "list3"]),
        CanvanBoard(title: "Title4", lists: ["list", "list2", "list3"])
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns,spacing: 10) {
                    ForEach(0...30, id: \.self) { _ in
                        CanvanView().foregroundColor(.red)
                            .aspectRatio(1.0, contentMode: .fit)
                            .padding()
                    }
                }
            }
            .toolbar{
                ToolbarItem {
                    Label("add",systemImage: "plus")}
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("CanvanApp")
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CanvanView: View{
    var body: some View {
        VStack {
            HStack {
                Text("CanvanText")
            }
            Text("List")
            Text("List2")
            Text("List3")
        }
    }
}
struct CanvanView2: View{
    var body: some View {
        VStack {
            HStack {
                Text("CanvanText2")
            }
            Text("List")
            Text("List2")
            Text("List3")
        }
    }
}
