//
//  SitesModel.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation
import MapKit
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
}
