//
//  CalendarView.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2023/03/20.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    @State private var dates: Set<DateComponents> = []
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    var bounds: Range<Date> {
        
        let start = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 6))!
        let end = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 16))!
        return start ..< end
    }
    
    var body: some View {
        VStack {
            MultiDatePicker("Dates Available", selection: $dates).frame(maxWidth:300,maxHeight:300)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
