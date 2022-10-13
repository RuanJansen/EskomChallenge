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
struct Event: Codable {
    let end: String
    let note: String
    let start: String
}

// MARK: - Info
struct Info: Codable {
    let name, region: String
}

// MARK: - Schedule
struct Schedule: Codable {
    let days: [Day]
    let source: String
}

// MARK: - Day
struct Day: Codable {
    let date, name: String
    let stages: [[String]]
}
