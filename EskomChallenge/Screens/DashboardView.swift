//
//  DashboardView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import MapKit
import Charts
struct DashboardView: View {
    
    @State var siteViewActive: Bool = false
    @State var sites: Sites
    @EnvironmentObject var vm: MapViewModel
    @StateObject var eskomApi = EskomApi()
    @State var provinceName: String = "Province"
    @State var siteName: String = "Sites"
    @State var progressValue: Float = 0.0
    @State var dayOfWeek: String = "weekday"
    
    //

    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                locationChoice()
                    .padding()
                activeLocationRing()
              
                totalDowntimeChart()
                
               
                Collapsible {
                    
                    
                        Text( "LoadShedding")
                            .font(.title2)
                            .bold()
                        
                } content: {
                    loadsheddingSchedule()

                }
                Divider()
                mapComponent()
                    .cornerRadius(30)
            }
        }
    }
    //MARK: Chart View for downtime
    
    @ViewBuilder
    func totalDowntimeChart()->some View{
        VStack(){
            VStack(alignment: .leading){
                HStack(){
                    Text("Total Site Down Time")
                        .font(.title2)
                    Spacer()
                    Menu {
                        ForEach(vm.filterdSites, id: \.self){ site in
                            Button{
                                siteName = site
                            } label: {
                                Text(site)
                            }
                        }
                    } label: {
                        Text(siteName == "Clear" ? "Sites" : siteName)
                    }
                    
                }
            }
            .padding()
            VStack{
                Chart{
                    ForEach(vm.sites[0].week, id: \.self){ value in
                        LineMark(x: .value("Weekly", value.days),
                                 y: .value("Hours", value.hours)
                        ).foregroundStyle(.red)
                        
                    }
                }
                .frame(width: 340, height: 150)
            }
        }
        
    }
    
    //MARK: MapComponent area
    @ViewBuilder
    func  mapComponent()->some View{
        
        VStack(alignment:.leading){
            Text("All Locations")
                .padding(.leading)
                .font(.title3)
            Map(
                coordinateRegion: $vm.mapRegion,
                annotationItems: vm.sites,
                annotationContent: { item in
                    MapAnnotation(coordinate: item.coordinate){
                        
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
                })
            .padding()
            //            .frame(height: 200)
            .foregroundColor(.gray)
            .ignoresSafeArea()
            .frame(height: UIScreen.main.bounds.height/4.5, alignment: .top)
            .cornerRadius(30)
            
        }
    }
    
    //MARK: Active Location Ring
    @ViewBuilder
    private func activeLocationRing() -> some View{
        
        
        ZStack{
            
            Rectangle()
                .frame(width: 370, height: 150)
                .cornerRadius(25)
                .foregroundColor(.white)
            
            
            
            HStack{
                ZStack{
                    Text("1/1 \n Locations")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                    
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame(width:80, height:80)
                        .opacity(0.5)
                        .foregroundColor(.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: 1.0)
                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width:80, height:80)
                        .foregroundColor(Color.red)
                        .rotationEffect(Angle(degrees: 270))
                    
                }
                .padding(.trailing)
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.red)
                        
                        Text("Offline Locations")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                        
                    }
                    Text("Current Loadshedding Stage: \(eskomApi.getCurrentStageValue())")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            
        }
        
        
    }
    
    struct progressBar: View{
        
        
        @Binding var progress: Float
        var color: Color = Color.pink
        var body: some View{
            ZStack{
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.20)
                    .foregroundColor(Color.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
            }
        }
    }
    
    //MARK: location section
    @ViewBuilder
    private func locationChoice()-> some View{
        
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
        
        
    }
    
    //MARK: loadshedding schedule
    @ViewBuilder
    private func loadsheddingSchedule()-> some View{
        VStack(alignment: .leading){
            HStack{
                Text("Schedule")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                Spacer()
                
                
                Menu {
                    ForEach(vm.dayOfWeek, id: \.self){ day in
                        Button{
                            dayOfWeek = day
                        } label: {
                            Text(day)
                        }
                    }
                } label: {
                    Text(dayOfWeek == "Clear" ? "Days" : dayOfWeek)
                }
                .padding()
                
                Menu {
                    ForEach(vm.filterdSites, id: \.self){ site in
                        Button{
                            siteName = site
                        } label: {
                            Text(site)
                        }
                    }
                } label: {
                    Text(siteName == "Clear" ? "Sites" : siteName)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    // we want to get the times for different stages.
                    
                    ForEach(1..<8){ stageValue in
                        VStack(){
                            Text("Stage \(stageValue)")
                                .foregroundColor(.black)
                                .font(.title2)
                                .bold()
                                .padding()
                            Divider()
                            ForEach(eskomApi.getStageTimes(loadSheddingStage: stageValue), id: \.self){ stage in
                                Text("\(stage)")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                
                            }
                        }
                    }
                    //
                    .frame(width: 180, height: 180)
                    .background(.white)
                    .cornerRadius(25)
                    
                    
                }
                
                .cornerRadius(25)
            }
        }
        
    }
    
    
        //MARK: collapsing view
    
        struct Collapsible<Content: View>: View{
            //collapsableView
               @State var label: () -> Text
               @State var content: () -> Content
               @State private var collapsed: Bool = true
            
            var body: some View{
                VStack{
                    Button(action: {self.collapsed.toggle()},
                           label: {
                        HStack{
                            self.label()
                            Spacer()
                            Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                        }
                        .padding(.bottom, 1)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    VStack{
                        self.content()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
                    .clipped()
                    .animation(.easeInOut)
                    .transition(.slide)
                }
            }
        }
    }

        






struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(sites: Sites(id: 0, name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), loadshedding: false, week: [Week(days: "Monday", hours: 2.5)]))
            .environmentObject(MapViewModel())
    }
}

