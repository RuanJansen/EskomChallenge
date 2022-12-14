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
            DashboardView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false, week: [Week(days: "Monday", hours: 2.5)])).tabItem{
                Label("Dashboard", systemImage: "chart.pie")
            }.environmentObject(MapViewModel())
            MapView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false, week: [Week(days: "Monday", hours: 2.5)])).tabItem{
                Label("Sites", systemImage: "map")
            }.environmentObject(MapViewModel())
        }.accentColor(.red)
            .onAppear(){
//                eskomApi.getAreas(
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
