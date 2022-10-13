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
    @EnvironmentObject var vm: MapViewModel
    @StateObject var eskomApi = EskomApi()
    var body: some View {
        VStack(alignment: .leading) {
            TopView().padding()
            MapView().ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height/3, alignment: .top)
                .cornerRadius(30)
                .padding()
            ScrollView {
                SiteSelector().padding()
                ForEach(vm.sites) { site in
                    Button{
                        vm.updateRegion(site: site)
                    }label:{
                        SiteButton(site: site)
                    }
                }
            }
            .padding()
        }.sheet(isPresented: $siteViewActive){
            SiteView().presentationDetents([.medium, .large])
        }
    }
    @ViewBuilder
    func SiteSelector()-> some View{
        Text("Offine")
            .font(.title2)
            .frame(width: .infinity)
            .bold()
    }
    
    @ViewBuilder
    func TopView()-> some View{
        HStack {
            Menu {
                ForEach(vm.provinces, id: \.self){ province in
                    Button{
                        //Filter
                    } label: {
                        Text(province)
                    }
                }
            } label: {
                //                Label("Provinces", systemImage: "line.3.horizontal.decrease.circle")
                Text("Provinces")
                    .font(.title2)
                    .bold()
                //
                //                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            Spacer()
            Button {} label: {
                Text("City")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.horizontal,15)
                    .background(.black, in: RoundedRectangle(cornerRadius: 15))
            }
        }
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
            ForEach(eskomApi.eventData?.schedule.days ?? [Day(date: "1", name: "1", stages: [["1"], ["1"]])], id:\.self) { day in
                HStack{
                    Image(true ? "lightbulb.fill"  : "lightbulb.slash.fill")
                    ForEach(day.stages, id:\.self) { stage in
                        ForEach(stage.count, id:\.self) { i in
                            Text(stage[i])
                        }
                    }
                    Spacer()
//                    Text("\(day.)")
                    
                }
            }
        }
        .padding()
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15,style: .continuous))
        .padding(.horizontal,10)
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
                        Button(action: {
                            vm.currentSite = item
                            siteViewActive = true
                        }) {
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
                        }
                        .task{
                            do {
                                try await eskomApi.getAreas(lat: Float(item.coordinate.latitude), lon: Float(item.coordinate.longitude))
                            } catch {
                                print("Error", error)
                            } 
                        }
                    }
                })
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false))
    }
}
