//
//  PersistenceManager.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/25/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import Foundation
import Combine

enum PersistenceError: Error {
    case wrapped(reason: Error)
    case message(reason: String)
    case notFound
}

protocol PersistenceManager {
    associatedtype Model: Identifiable & Codable
    func save(_ model: Model) -> AnyPublisher<Bool, PersistenceError>
    func load() -> AnyPublisher<Model, PersistenceError>
}

class SchedulePersistenceManager: PersistenceManager {
    typealias Model = Schedule
    
    private let db = UserDefaults(suiteName: "com.setecastronomy.punctualparent.schedule")
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func save(_ model: Model) -> AnyPublisher<Bool, PersistenceError> {
        return Future { promise in
            guard let encoded = try? self.encoder.encode(model) else {
                promise(.failure(.message(reason: "Failed to encode")))
                return
            }
            guard let db = self.db else {
                promise(.failure(.message(reason: "Failed to get DB")))
                return
            }
            
            db.setValue(encoded, forKey: "schedule")
            promise(.success(true))
        }.eraseToAnyPublisher()
    }
    
    func load() -> AnyPublisher<Model, PersistenceError> {
        return Future { promise in
            guard let loaded = self.db?.data(forKey: "schedule") else {
                promise(.failure(.notFound))
                return
            }
            
            guard let decoded = try? self.decoder.decode(Model.self, from: loaded) else {
                promise(.failure(.message(reason: "Failed to decode")))
                return
            }
            
            promise(.success(decoded))
        }.eraseToAnyPublisher()
    }
}
