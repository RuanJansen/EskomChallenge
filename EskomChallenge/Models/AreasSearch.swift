//
//  AreasSearch.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/13.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let areasSearch = try? newJSONDecoder().decode(AreasSearch.self, from: jsonData)

import Foundation

// MARK: - AreasSearch
struct AreasSearch: Codable {
    let areas: [AreaSearch]
}

// MARK: - Area
struct AreaSearch: Codable {
    let id, name: String
    let region: Region
}

enum Region: String, Codable {
    case eskomDirectCityOfJohannesburgGauteng = "Eskom Direct, City of Johannesburg, Gauteng"
    case eskomDirectWebCityOfJohannesburgGauteng = "Eskom Direct (Web), City of Johannesburg, Gauteng"
}
