//
//  SiteDetailView.swift
//  EskomChallenge
//
//  Created by Pat on 2022/10/13.
//

import SwiftUI

struct SiteDetailView: View {
    var body: some View {
        ScrollView {
            VStack {
                TopSection()
                    .padding(.vertical)
                ChartView()
                Divider()
                    .padding(.vertical)
                ScheduleView()
            }
            .padding(.horizontal,10)
        }
    }
    
    @ViewBuilder
    private func TopSection()-> some View{
        HStack {
            VStack(alignment: .leading) {
                Text("Site A")
                    .font(.title2.bold())
                Text("Average days online")
            }
            Spacer()
        }
        
    }
    
    @ViewBuilder
    private func ChartView()-> some View{
        RoundedRectangle(cornerRadius: 15,style: .continuous)
            .frame(width: 380, height: 280)
            .foregroundColor(.gray)
        
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 380, height: 25)
            .foregroundColor(.gray)
    }
    
    @ViewBuilder
    private func ScheduleView()-> some View{
        VStack {
            HStack {
                Text("Site Schedule")
                Spacer()
            }
            .padding(.bottom,20)
            ForEach(0 ..< 5) { item in
                ScheduleRow()
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
        }
    }
    
    @ViewBuilder
    func ScheduleRow()-> some View{
        HStack(alignment: .top){
            Text("MON")
            Spacer()
            VStack {
                ForEach(0 ..< 3) { item in
                    Text("00:00 - 00:00")
                }
            }
        }
        .padding()
    }
    
//    var button: some View{
//        return Button {
//
//        } label: {
//
//        }
//
//    }
    
}

struct SiteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SiteDetailView()
    }
}
