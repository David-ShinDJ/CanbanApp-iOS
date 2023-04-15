//
//  CanvanDetailView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI

struct CanvanDetailView: View {
    
    let canvan:Canvan
    
    var dateString:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: canvan.date)
    }
    @State var newDescription:String = ""
    @State var newPriority:Int = 0
    @StateObject var canvanController:CanvanController
    let step = 1
    let range = 0...3
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(canvan.title)
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    Spacer()
                }
                TextEditor(text: $newDescription)
                Spacer()
                HStack {
                    Spacer()
                    Stepper(value: $newPriority,
                            in: range,
                            step: step) {
                        Text("우선순위 \(newPriority)")
                    }
                        .padding(10)
                    Text("생성날짜:\(dateString)")
                        .font(.headline)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(id: "Update",placement: .bottomBar) {
                    Button("Update") {
                        self.canvanController.updateCanvan(description: newDescription, priority: newPriority)
                    }
                }
                ToolbarItem(id: "Delete", placement: .bottomBar) {
                    Button("Delete") {
                        self.canvanController.deleteCanvan()
                    }.foregroundColor(.red)
                }
            }
            .onAppear {
                self.newDescription = canvan.description
                self.canvanController.setCanvan(self.canvan.id)
            }
        }
    }
}

