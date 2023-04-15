//
//  ContentView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
import SwiftUI
import Foundation
import UniformTypeIdentifiers

// CanvanField 같은 칸반 모델을 공유하고 그 모델은 Type 존재해서 칸반을 이동시킬떄 타입이 변경된다

struct ContentView: View {
    @State var showingAlert:Bool = false
    @StateObject var canvanController:CanvanController = CanvanController()
    var body: some View {
        BacklogView(canvanController: canvanController)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//MARK: 각뷰의 하나의 컨트롤러로 모든걸 관리할수있는 컨트롤러 공통으로 사용하기 각 하위뷰에서 칸반생성및 넘겨주기가능
