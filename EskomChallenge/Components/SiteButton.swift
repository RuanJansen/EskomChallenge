//
//  SiteButton.swift
//  EskomChallenge
//
//  Created by Pat on 2022/10/12.
//

import SwiftUI

struct SiteButton: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40, height: 40)
                Text("Site A")
                    .font(.title2).fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title2)
            }
            Rectangle()
                .frame(height: 0.5)
            HStack{
                Image(systemName: "lightbulb.slash.fill")
                Text("18:00 - 20:00")
                Spacer()
            }
        }
        .padding()
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15,style: .continuous))
        .padding(.horizontal,10)
      
    }
}

struct SiteButton_Previews: PreviewProvider {
    static var previews: some View {
        SiteButton()
    }
}
