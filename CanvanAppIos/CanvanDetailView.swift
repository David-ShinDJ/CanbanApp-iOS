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
    var body: some View {
        VStack(alignment:.leading,spacing:20) {
            Text(canvan.title)
                .font(.largeTitle)
                .padding()
            Text(canvan.description)
                .font(.body)
                .frame(alignment: .center)
            Spacer()
            Text("Priority \(canvan.priority)")
            Text("Date:\(dateString)")
                .font(.headline)
        }
    }
}

struct CanvanDetailView_Previews: PreviewProvider {
    static let canvanSample = Canvan(title: "칸반제목", description: "칸반의내용을 담고있다 긴글............", priority: 1, date: Date())
    static var previews: some View {
        CanvanDetailView(canvan: canvanSample)
    }
}
