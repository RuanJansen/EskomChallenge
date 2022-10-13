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
             activeLocationRing()
             locationChoice()
             loadsheddingSchedule()
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
            .frame(width: 100, height: 150)
            .cornerRadius(25)
            .background(.gray)
            
            
        
        HStack{
            Image(systemName: "power.circle.fill")
            VStack{
                Text("Offline Locations")
                    .font(.title2)
                Text("current loadshedding Stage")
                    .font(.subheadline)
                    .foregroundColor(.black)
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
    ScrollView(.horizontal, showsIndicators: false){
        HStack(spacing: 20){
            ForEach(1..<9){
               
                    Text("Stage \($0)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(width: 100, height: 100)
                        .background(.gray)
                    
            }

        }
    }
}

@ViewBuilder
private func  mapComponent()->some View{
    RoundedRectangle(cornerRadius: 15)
        .padding()
        .frame(height: 200)
        .foregroundColor(.gray)
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
