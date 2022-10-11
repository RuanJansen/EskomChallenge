//
//  MapComponent.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import MapKit

struct MapComponent: View {
    let dataHolder = DataHolder()
    let provinces: [String] = ["Eastern Cape", "Free State", "Gauteng", "KwaZulu-Natal", "Limpopo", "Mpumalanga", "Northern Cape", "North West", "Western Cape"]
    @State var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -33.9249,
            longitude: 18.4241),
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
         longitudeDelta: 0.2))
    var body: some View {
        ZStack{
            Map(
                coordinateRegion: $mapRegion,
                annotationItems: dataHolder.data,
                annotationContent: { item in
                    MapAnnotation(coordinate: item.coordinate){
                        Button(action: {
                            
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
                    }
                })
            VStack{
                HStack{
                    Spacer()
                    Menu {
                        ForEach(provinces, id: \.self){ province in
                            Button{
                                //Filter
                            } label: {
                                Text(province)
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
                Spacer()
            }.padding()
        }.ignoresSafeArea()
            .frame(height: UIScreen.main.bounds.height/2, alignment: .top)
            .cornerRadius(30)
            .padding()
    }
}

struct MapComponent_Previews: PreviewProvider {
    static var previews: some View {
        MapComponent()
    }
}


extension MapComponent{
    class DataHolder{
        @Published var data = [DummyData](arrayLiteral:
                                            DummyData(site: "One", coordinate:CLLocationCoordinate2D(latitude: -33.9249,longitude: 18.4241), id: "1"),
                                          DummyData(site: "Two", coordinate: CLLocationCoordinate2D(latitude: -33.9649,longitude: 18.4547), id: "2"))
    }

    class DummyData: Identifiable, Hashable{
        
        
        
        static func == (lhs: DummyData, rhs: DummyData) -> Bool {
            lhs.id == rhs.id
        }
    //    let id = UUID()
        let id: String
        let site: String
        let coordinate: CLLocationCoordinate2D
        
        init(site: String, coordinate: CLLocationCoordinate2D, id: String) {
            self.site = site
            self.coordinate = coordinate
            self.id = id
        }
        
        func hash(into hasher: inout Hasher){
            hasher.combine(id)
        }
    }
}
