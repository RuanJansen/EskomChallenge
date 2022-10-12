//
//  ContentView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    let eskomApi = EskomApi()
    var body: some View {
        TabView{
            DashboardView().tabItem{
                Label("Dashboard", systemImage: "chart.pie")
            }
            MapView().tabItem{
                Label("Sites", systemImage: "map")
            }
        }.accentColor(.red)
            .onAppear(){
                eskomApi.getAreas()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
