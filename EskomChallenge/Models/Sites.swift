//
//  SitesModel.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation
import MapKit
import Charts
struct Sites: Identifiable, Hashable{
    static func == (lhs: Sites, rhs: Sites) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let name: String
    let coordinate: CLLocationCoordinate2D
    let loadshedding: Bool
    let week: [Week]
}

struct Week: Identifiable, Hashable{
    
    static func == (lhs: Week, rhs: Week) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id = UUID()
    let days: String
    let hours: Double
}
