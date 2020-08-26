//
//  ScheduleRowViewModel.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/11/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

struct ScheduleRowViewModel {
    let item: ScheduleItem
    
    var formattedStartTime: String {
        return formatter.string(from: item.startTime)
    }
    
    var backgroundColor: Color {
        switch item.type {
        case .wake:
            return .green
        case .nap:
            return .orange
        case .snack:
            return .blue
        case .milk:
            return .purple
        case .meal:
            return .blue
        case .bed:
            return .orange
        }
    }
    
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }
}
