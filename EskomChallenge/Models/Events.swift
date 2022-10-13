//
//  EskomModel.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation

// MARK: - Events
struct Events: Codable {
    let events: [Event]
    let info: Info
    let schedule: Schedule
}

// MARK: - Event
struct Event: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(start)
    }
    let end: String
    let note: String
    let start: String
}

// MARK: - Info
struct Info: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(region)
    }
    let name, region: String
}

// MARK: - Schedule
struct Schedule: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(source)
    }
    let days: [Day]
    let source: String
}

// MARK: - Day
struct Day: Codable, Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    let date, name: String
    let stages: [[String]]
}
