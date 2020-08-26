//
//  ScheduleItem.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/11/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import Foundation

struct ScheduleItem: Identifiable {
    typealias ID = Int
    
    var id: Int
    let type: ScheduleType
    let name: String
    let startTime: Date
}
