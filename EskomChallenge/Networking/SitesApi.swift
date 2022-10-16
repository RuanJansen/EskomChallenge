//
//  SitesApi.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation
import MapKit
class SitesApi{
    static let sites: [Sites] = [
    Sites(id: 1,
          name: "A",
          coordinate: CLLocationCoordinate2D(latitude: -33.9249, longitude: 18.4241),
          loadshedding: true),
    Sites(id: 2,
          name: "B",
          coordinate: CLLocationCoordinate2D(latitude: -33.9649, longitude: 18.4547),
          loadshedding: false),
    Sites(id: 3,
          name: "C",
          coordinate: CLLocationCoordinate2D(latitude: -33.9849, longitude: 18.4517),
          loadshedding: true)
    ]
}
