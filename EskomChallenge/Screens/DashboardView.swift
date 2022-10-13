//
//  DashboardView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView{
            VStack{
                locationChoice()
                    .padding()
             activeLocationRing()
            // locationChoice()
                    .padding()
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
            
            
        
        HStack{
            Image(systemName: "power.circle.fill")
                .foregroundColor(.white)
                .padding()
            
            VStack(alignment: .leading){
                Text("Offline Locations")
                    .font(.title2)
                    .foregroundColor(.white)
                Text("current loadshedding Stage")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            
         
            
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

@ViewBuilder
private func  mapComponent()->some View{
    VStack(alignment:.leading){
        Text("View in Maps")
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
