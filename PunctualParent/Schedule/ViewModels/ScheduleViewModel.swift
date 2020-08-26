//
//  ScheduleViewModel.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/11/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import Foundation
import Combine

class ScheduleViewModel: ObservableObject {
    private let db = SchedulePersistenceManager()
    private var storage = Set<AnyCancellable>()
    @Published private(set) var datasource: [ScheduleItem] = []
    
    init() {
        db.load()
            .sink(receiveCompletion: { (completion) in
                print(completion)
            }) { (schedule) in
                self.datasource = schedule.scheduleItems
            }.store(in: &storage)
        
    }
    
    func start() {
        let schedule = Schedule(startDate: Date())
        self.datasource = schedule.scheduleItems
        db.save(schedule)
            .sink(receiveCompletion: { (completion) in
                print(completion)
            }) { (success) in
                print(success)
            }.store(in: &storage)
    }
}
