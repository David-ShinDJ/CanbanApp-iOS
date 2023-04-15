//
//  ContentViewModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/11.
//

import Foundation
class CanvanController: ObservableObject {
    @Published var canvanItems:[Canvan] = []
    @Published var index:Int? = Int()
    init() {
        readCanvan()
    }
    
    // CRUD Canvan
    
    // Create Canvan
    func createCanvan(title:String, description:String) {
        let newCanvan = Canvan(id: UUID(), title: title, description: description, field: .Backlog, isSelected: true, priority: 0, date: Date())
        self.canvanItems.append(newCanvan)
        UserDefaults.standard.setCanvansToDefault(canvanItems, forKey: "Canvans")
        
    }
    
    func readCanvan() {
        if let datas = UserDefaults.standard.setDefaultToCanvans(dataType: Canvan.self, key: "Canvans") {
            self.canvanItems = datas
        } else {
            self.canvanItems = []
        }
    }
    
    func setCanvan(_ id:UUID) {
        self.index = self.canvanItems.firstIndex(where: { Canvan in
            Canvan.id == id
        })
    }
    // Update 방식 Canvan Id 값으로 Array 필터링 사용해서 업데이트
    
    func updateCanvan(description:String, priority:Int) {
        if self.index == nil {
            print("업데이트할 칸반을 찾지 못했습니다")
        } else {
            self.canvanItems[self.index!].description = description
            self.canvanItems[self.index!].priority = priority
            UserDefaults.standard.setCanvansToDefault(canvanItems, forKey: "Canvans")
        }
        
    }
    
    func deleteCanvan() {
        if self.index == nil {
            print("삭제할 칸반을 찾지못했습니다")
        } else {
            print("삭제 : \(canvanItems[self.index!].title)")
            self.canvanItems.remove(at: self.index!)
            UserDefaults.standard.setCanvansToDefault(canvanItems, forKey: "Canvans")
        }
    }
    
    
}


