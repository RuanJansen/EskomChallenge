//
//  MapViewModel.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/13.
//

import Foundation
import MapKit
import SwiftUI
class MapViewModel: ObservableObject{
    @Published var sites: [Sites]
    @Published var currentSite = Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false, week: [Week(days: "Monday", hours: 2.5)])
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -28.559482,
            longitude: 24.937505999999985),
        span: MKCoordinateSpan(
            latitudeDelta: 15,
         longitudeDelta: 15))
    let provinces: [String] = ["Clear", "Eastern Cape", "Free State", "Gauteng", "KwaZulu-Natal", "Limpopo", "Mpumalanga", "Northern Cape", "North West", "Western Cape"]
    let filterdSites: [String] = ["Site A", "Site B", "Site C"]
    let dayOfWeek: [String] = ["Mon","Tues","Weds","Thurs","Fri","Sat","Sun"]

    
    init(){
        self.sites = SitesApi.sites
    }
    
    func updateRegion(site: Sites){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: site.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                                  longitudeDelta: 0.2))
        }
    }
    
}
