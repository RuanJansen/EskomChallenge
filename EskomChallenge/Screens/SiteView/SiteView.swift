//
//  SiteView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI

struct SiteView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TopView()
                MapView()
                SiteSelector()
                ForEach(0 ..< 3) { item in
                    SiteButton()
                }
            }
            .padding()
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
            Text("Provinces")
                .font(.title2)
                .bold()
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
    
    //Map View
    @ViewBuilder
    func MapView()-> some View{
        RoundedRectangle(cornerRadius: 15)
            .padding()
            .frame(height: 400)
            .foregroundColor(.gray)
            
    }
}

struct SiteView_Previews: PreviewProvider {
    static var previews: some View {
        SiteView()
    }
}
