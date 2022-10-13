//
//  DashboardView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import MapKit

struct DashboardView: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        ScrollView{
            VStack{
                locationChoice()
                    .padding()
             activeLocationRing()
            // locationChoice()
               
                
             loadsheddingSchedule()
                .padding()
            mapComponent()
            }
        }
    }
 
}



//MARK: Active Location Ring
@ViewBuilder
private func activeLocationRing() -> some View{
    
    ZStack{
        
        Rectangle()
            .frame(width: 370, height: 150)
            .cornerRadius(25)
            
            
        //progress view
//
//        progressBar(progress:self.$progressValue)
//                .frame(width:160, height: 160)
//                .padding(20)
//                .onAppear(){
//                    DashboardView.progressValue = 0.3
        HStack{
           Text("progressView")
                .foregroundColor(.white)
            
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "power.circle.fill")
                        .foregroundColor(.pink)
                        
                    Text("Offline Locations")
                        .font(.title2)
                        .foregroundColor(.white)
                   
                }
                Text("current loadshedding Stage")
                    .font(.subheadline)
                    .foregroundColor(.white)
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
        
        Menu("Region"){
            
            Button("Gauteng"){}
            Button("North West"){}
            Button("Western Cape"){}
            Button("Eastern Cape"){}
            Button("Nothern Cape"){}
            Button("Free State"){}
            Button("Limpopo"){}
            Button("KwaZulu Natal"){}
       
        }
            
            
      
    }
    
 
}

//MARK: loadshedding schedule
@ViewBuilder
private func loadsheddingSchedule()-> some View{
    VStack(alignment: .leading){
        HStack{
        Text("LoadShedding Schedule")
            .font(.title3)
            .multilineTextAlignment(.leading)
           Spacer()
        Menu("Day"){
            
            Button("Monday"){}
            Button("Tuesday"){}
            Button("Wednesday"){}
            Button("Thursday"){}
            Button("Friday"){}
            Button("Saturday"){}
            Button("Sunday"){}
            
       
        }
    }
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
               
                    ForEach(1..<9){
                    
                        Text("Stage \($0)")
                            .foregroundColor(.black)
                            .font(.title2)
                            .frame(width: 180, height: 180)
                            .cornerRadius(25)
                            .background(.gray)
                        
                        
            
                }
               
                .cornerRadius(25)
            }
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
            
            
        RoundedRectangle(cornerRadius: 15)
       
            .padding()
            .frame(height: 200)
            .foregroundColor(.gray)
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
