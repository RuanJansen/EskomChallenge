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
//    let sitesApi = SitesApi()
    @Published var sites: [Sites]
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -33.9249,
            longitude: 18.4241),
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
         longitudeDelta: 0.2))
    let provinces: [String] = ["Eastern Cape", "Free State", "Gauteng", "KwaZulu-Natal", "Limpopo", "Mpumalanga", "Northern Cape", "North West", "Western Cape"]
    
    init(){
//        let site = SitesApi.sites
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
