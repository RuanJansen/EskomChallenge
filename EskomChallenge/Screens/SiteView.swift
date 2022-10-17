//
//  SiteView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI

struct SiteView: View {
    @StateObject var eskomApi = EskomApi()
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
            ForEach(eskomApi.getDays(), id: \.self) { item in
                ScheduleRow(dayText: item.name, days: item)
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
        }
    }
    
    @ViewBuilder
    func ScheduleRow(dayText: String, days: Day)-> some View{
        HStack(alignment: .top){
            Text(dayText.prefix(3))
                .bold()
            Spacer()
            VStack {
                if days.name == dayText{
                    ForEach(days.stages[eskomApi.currentStage ?? 1], id: \.self) { i in
                        Text(i)
                    }
                }
            }
        }
        .padding()
    }
}

struct SiteView_Previews: PreviewProvider {
    static var previews: some View {
        SiteView()
    }
}
