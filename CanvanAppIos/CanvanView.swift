//
//  CanvanView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/20.
//

import Foundation
import SwiftUI

struct CanvanView: View {
    let canvan: Canvan
    var body: some View {
        HStack {
            Text(canvan.title)
            Text("\(canvan.priority)")
        }
    }
}
