//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import Foundation
import UniformTypeIdentifiers

let canvanSample:Canvan = Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())

struct FileInfo: Identifiable {
    var id: String { name }
    let name: String
    let fileType: UTType
}

struct ContentView: View {
    @State var showingAlert:Bool = false
    @State var alertDetails: FileInfo?
    var body: some View {
        NavigationView {
            VStack {
                CalendarView()
                CanvanView(canvan: canvanSample)
            }.toolbar {
                ToolbarItem(id: "addCanvan", placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAlert.toggle()
                    }
                    .alert(isPresented: $showingAlert) { details in
                        Alert(title: Text("Import Complete"),
                              message: Text("""
                                Imported \(details.name) \n File
                                type: \(details.fileType.description).
                                """),
                              dismissButton: .default(Text("Dismiss")))
                    }
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
