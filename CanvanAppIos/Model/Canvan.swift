//
//  CanvanModel.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/10/08.
//
import SwiftUI
import Foundation

// MARK: Model 만들떄 기준
// Struct VS Class 데이터 값의 변경이 이루어지는경우 순환참조 강한참조등 발생할수있으므로
// 또한 Swift에서 값 타입과 reference 타입의 차이점을 이해하고, 이를 이용하여 데이터 모델링을 잘 해야 합니다. 값 타입은 값이 복사되어 전달되지만, reference 타입은 참조가 전달됩니다.
// Codable 하는경우 안에 다른 enum, OR Json 참조를 하게되는경우 새로운 해당 모델도 Decodeable 할수있게 모델의 확장이 필요하다



struct Canvan: Identifiable, Codable {
    
    enum Field: String, Codable {
        case Backlog
        case Inprogress
        case Done
    }
    
    let id: UUID
    let title: String
    var description: String
    var field: Field
    var isSelected: Bool
    var priority: Int
    var date: Date
    
    init(id: UUID, title: String, description: String, field: Field, isSelected: Bool, priority: Int, date: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.field = field
        self.isSelected = isSelected
        self.priority = priority
        self.date = date
    }
    
    // Decodeable init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        field = try container.decode(Field.self, forKey: .field)
        isSelected = try container.decode(Bool.self, forKey: .isSelected)
        priority = try container.decode(Int.self, forKey: .priority)
        date = try container.decode(Date.self, forKey: .date)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case field
        case isSelected
        case priority
        case date
    }
}


extension UserDefaults {
    
    func setCanvansToDefault<T: Codable>(_ data: [T]?, forKey defaultName:String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded,  forKey: defaultName)
    }

    func setDefaultToCanvans<T: Codable>(dataType: T.Type, key: String) -> [T]? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode([T].self, from: userDefaultData)
    }
}

