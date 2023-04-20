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
    func createCanvan(title:String, description:String, field:Field) {
        let newCanvan = Canvan(id: UUID(), title: title, description: description, field: field, isSelected: false, priority: 0, date: Date())
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
    // Update 방식 self.index 칸반Array Index Number 저장
    
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
    
    
    
    // Field 값에 따른 Canvans 분류
    func backlogCanvans() -> [Canvan] {
        self.canvanItems.filter {$0.field == .Backlog}
    }
    
    func inprogressCanvans() -> [Canvan] {
        self.canvanItems.filter {$0.field == .Inprogress }
    }
    
    func DoneCanvans() -> [Canvan] {
        self.canvanItems.filter {$0.field == .Done }
    }
    
    func nextCanvan() {
        if self.index == nil {
            print("선택된 칸반이 없습니다")
            return
        }
        if self.canvanItems[self.index!].field == .Backlog {
            self.canvanItems[self.index!].field = .Inprogress
            
        } else {
            self.canvanItems[self.index!].field = .Done
        }
        UserDefaults.standard.setCanvansToDefault(canvanItems, forKey: "Canvans")
    }
    
    func previousCanvan() {
        if self.index == nil {
            print("선택된 칸반이 없습니다")
            return
        }
        
        if self.canvanItems[self.index!].field == .Inprogress {
            self.canvanItems[self.index!].field = .Backlog
        } else {
            self.canvanItems[self.index!].field = .Inprogress
        }
        UserDefaults.standard.setCanvansToDefault(canvanItems, forKey: "Canvans")
    }
    
    // 실시간 동기화문제 @Publisehd 업데이트 되면 View 반영이 바로 가능하게 만들기..
    
    // Canvan Select
    
}


