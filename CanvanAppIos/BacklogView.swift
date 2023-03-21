//
//  BacklogView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/21.
//

import Foundation
import SwiftUI



struct BacklogView: View {
    @StateObject var viewModel:ContentViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                List(viewModel.canvanItems) { canvan in
                    NavigationLink {
                        CanvanView(canvan: canvan)
                    } label: {
                        Text(canvan.title)
                    }
                }
            }
        }
    }
}
