//
//  ContentView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import MapKit
struct ContentView: View {
    let eskomApi = EskomApi()
    var body: some View {
        TabView{
            DashboardView().tabItem{
                Label("Dashboard", systemImage: "chart.pie")
            }
            MapView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false)).tabItem{
                Label("Sites", systemImage: "map")
            }.environmentObject(MapViewModel())
        }.accentColor(.red)
//            .task{
//                do {
//                    try await eskomApi.getAreas(lat: -28.559482, lon: 24.937505999999985)
//                } catch {
//                    print("Error", error)
//                }
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
