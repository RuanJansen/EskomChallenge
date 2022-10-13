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
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
 
}
//MARK: Active Location Ring
@ViewBuilder
private func activeLocationRing() -> some View{
    ZStack{
        Rectangle()
            .frame(width: 300, height: 250)
            .cornerRadius(25)
            
        
        HStack{
            Image(systemName: "power.circle.fill")
            VStack{
                Text("Offline Locations")
                    .font(.title2)
                Text("current loadshedding Stage")
                    .font(.subheadline)
                    .foregroundColor(.gray)
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
        
        Button{}label:{
            Text("Region")
//            Menu("Region"){
//
//                Button("Western Cape", action: westernCape)
//                Button("Gauteng", action: westernCape)
//                Button("Eastern Cape", action: westernCape)
//                Button("North West", action: westernCape)
//                Button("Free State", action: westernCape)
//                Button("KwaZulu-Natal", action: westernCape)
//                Button("Mpumalanga ", action: westernCape)
//                Button("Limpopo ", action: westernCape)
//
//            }
            
        }
    }
    
 
}

//MARK: loadshedding schedule
@ViewBuilder
private func loadsheddingSchedule()-> some View{
    ScrollView(.horizontal){
        HStack(spacing: 20){
            ForEach(0..<9){
               
                    Text("Stage \($0)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(width: 200, height: 200)
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
