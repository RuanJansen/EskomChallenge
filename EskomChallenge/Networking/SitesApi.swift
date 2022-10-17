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
              loadshedding: true, week: [
                Week(
                days: "Mon",
                hours: 2.5),
                Week(
                days: "Tue",
                hours: 0),
                Week(
                days: "Wed",
                hours: 4),
                Week(
                days: "Thu",
                hours: 0),
                Week(
                days: "Fri",
                hours: 4),
                Week(
                days: "Sat",
                hours: 2.5),
                Week(
                days: "Sun",
                hours: 2.5),
                 
              ])
//    Sites(id: 2,
//          name: "B",
//          coordinate: CLLocationCoordinate2D(latitude: -33.9649, longitude: 18.4547),
//          loadshedding: false),
//    Sites(id: 3,
//          name: "C",
//          coordinate: CLLocationCoordinate2D(latitude: -33.9849, longitude: 18.4517),
//          loadshedding: true),
//    Sites(id: 4,
//          name: "D",
//          coordinate: CLLocationCoordinate2D(latitude: -28.559482, longitude: 24.937505999999985),
//          loadshedding: true)
    ]
}
