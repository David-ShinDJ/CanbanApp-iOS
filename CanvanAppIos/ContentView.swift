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
    var body: some View {
        VStack{
            Text("CanbanApp").font(.title)
            VStack(alignment: .center, spacing: 6
            ) {
                HStack{
                    TextEditor(text: $canvanTitle)
                }
            }
        }.padding()
            .toolbar{
                ToolbarItem {
                    Label("add",systemImage: "plus")                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//HStack
//    {
//    Image(systemName: "pencil")
//    TextEditor(text: $canvanTitle
//    )
//    .foregroundColor(.blue)
//    .font(.title2)
//    .focused($focusedField, equals: .first)
//}
