//
//  SitesApi.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation
import MapKit
class SitesApi{
//have yet to recieve access to the actual data.
    static let sites: [Sites] = [
        Sites(id: 1,
              name: "Site A",
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
    ]
}
