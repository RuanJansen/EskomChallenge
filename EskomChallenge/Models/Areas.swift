//
//  Areas.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/12.
//

import Foundation

// MARK: - Areas
struct Areas: Codable {
    let areas: [Area]
}

// MARK: - Area
struct Area: Codable {
    let count: Int
    let id: String
}
