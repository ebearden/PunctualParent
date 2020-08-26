//
//  Schedule.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/11/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import Foundation

class Schedule: Codable, Identifiable {
    var startDate: Date?
    var scheduleItems: [ScheduleItem] {
        guard let startDate = startDate else { return [] }
        return [
            ScheduleItem(id: 0, type: .wake, name: "Wake up", startTime: startDate),
            ScheduleItem(id: 1, type: .meal, name: "Breakfast", startTime: startDate.addingTimeInterval(Schedule.timeToBreakfast)),
            ScheduleItem(id: 2, type: .nap, name: "Nap", startTime: startDate.addingTimeInterval(Schedule.timeToNap)),
            ScheduleItem(id: 3, type: .snack, name: "Snack", startTime: startDate.addingTimeInterval(Schedule.postNapSnack)),
            ScheduleItem(id: 4, type: .milk, name: "Milk", startTime: startDate.addingTimeInterval(Schedule.postNapMilk)),
            ScheduleItem(id: 5, type: .meal, name: "Lunch", startTime: startDate.addingTimeInterval(Schedule.timeToLunch))
        ]
    }
    
    private static var timeToBreakfast: TimeInterval {
        return TimeIntervalConstants.hour
    }
    
    private static var timeToNap: TimeInterval {
        return TimeIntervalConstants.hour +
            TimeIntervalConstants.hour +
            TimeIntervalConstants.fifteenMinutes
    }
    
    private static var postNapSnack: TimeInterval {
        return Schedule.timeToNap +
            TimeIntervalConstants.hour +
            TimeIntervalConstants.hour
    }
    
    private static var postNapMilk: TimeInterval {
        return Schedule.timeToNap +
            TimeIntervalConstants.hour +
            TimeIntervalConstants.hour +
            TimeIntervalConstants.fifteenMinutes
    }
    
    private static var timeToLunch: TimeInterval {
        return Schedule.postNapSnack +
            TimeIntervalConstants.hour +
            TimeIntervalConstants.hour
    }
    
    init(startDate: Date? = nil) {
        self.startDate = startDate
    }
}
