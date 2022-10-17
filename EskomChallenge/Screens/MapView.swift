//
//  MapView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var siteViewActive: Bool = false
    @State var sites: Sites
    @StateObject var eskomApi = EskomApi()
    @State var provinceName: String = "Province"
    @EnvironmentObject var vm: MapViewModel
    
    var body: some View {
        
            VStack(alignment: .leading) {
                TopView()
                MapView()
                SelectorScrollView()
                
            }.sheet(isPresented: $siteViewActive){
                SiteView(site: $sites).presentationDetents([.fraction(0.5), .fraction(1)])
            }
    }
    
    @ViewBuilder
    func SiteSelector()-> some View{
        Text("Offine")
            .font(.title2)
            .bold()
    }
    
    @ViewBuilder
    func TopView()-> some View{
        HStack{
            Text("Province")
                .font(.title2)
                .bold()
            
            Spacer()
            
            
            Menu {
                ForEach(vm.provinces, id: \.self){ province in
                    Button{
                        provinceName = province
                    } label: {
                        Text(province)
                    }
                }
            } label: {
                Text(provinceName == "Clear" ? "Province" : provinceName)
            }
            
            
            
        }
        .padding()
    }

    //Map View
    @ViewBuilder
    func MapView()-> some View{
        ZStack{
            Map(
                coordinateRegion: $vm.mapRegion,
                annotationItems: vm.sites,
                annotationContent: { item in
                    MapAnnotation(coordinate: item.coordinate){
                        Button {
                            vm.currentSite = item
                            siteViewActive = true
                        } label:{
                            VStack{
                                Image(systemName: "map.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(.red)
                                    .cornerRadius(36)
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.red)
                                    .rotationEffect(Angle(degrees: 180))
                                    .offset(y: -10)
                                    .padding(.bottom, 30)
                            }
                        }.onAppear{
                            sites = item
                        }
                    }
                })
        }
        .ignoresSafeArea()
        .frame(height: UIScreen.main.bounds.height/3.5, alignment: .top)
            .cornerRadius(30)
            .padding()
    }
    
    //SiteButton
    @ViewBuilder
    func SiteButton(site: Sites)-> some View{
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40, height: 40)
                Text(site.name)
                    .font(.title2).fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title2)
            }
            Rectangle()
                .frame(height: 0.5)
            HStack{
                Image(systemName: "lightbulb.slash.fill")
                ForEach(vm.sites) { siteTime in
                    
                }
                Text("18:00 - 20:00")
                Spacer()
            }
        }
        .padding()
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15,style: .continuous))
        .padding(.horizontal,10)
    }
    
    //Scroll View
    @ViewBuilder
    func SelectorScrollView()-> some View{
        ScrollView {
            SiteSelector().padding()
            ForEach(vm.sites) { site in
            Button{
                vm.updateRegion(site: site)
            }label:{
//                SiteButton(site: site)
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 40, height: 40)
                        Text(site.name)
                            .font(.title2).fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    Rectangle()
                        .frame(height: 0.5)
                    HStack{
                        Spacer()
                        Image(systemName: "lightbulb.slash.fill")
                        
                        VStack {
                            Text(eskomApi.getStageTimes().first ?? "")
                        }
                        
                    }
                }
                .padding()
                .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15,style: .continuous))
                .padding(.horizontal,10)
            }
        }
    }
    .padding()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false, week: [Week(days: "Monday", hours: 2.5)]))
            .environmentObject(MapViewModel())
    }
}
