//
//  Status.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/13.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let status = try? newJSONDecoder().decode(Status.self, from: jsonData)

import Foundation

// MARK: - Status
struct Status: Codable {
    let status: StatusClass
}

// MARK: - StatusClass
struct StatusClass: Codable {
    let capetown, eskom: Capetown
}

// MARK: - Capetown
struct Capetown: Codable {
    let name: String
    let nextStages: [NextStage]
    let stage, stageUpdated: String

    enum CodingKeys: String, CodingKey {
        case name
        case nextStages = "next_stages"
        case stage
        case stageUpdated = "stage_updated"
    }
}

// MARK: - NextStage
struct NextStage: Codable {
    let stage: String
    let stageStartTimestamp: Date

    enum CodingKeys: String, CodingKey {
        case stage
        case stageStartTimestamp = "stage_start_timestamp"
    }
}
