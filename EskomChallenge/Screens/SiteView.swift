//
//  SiteView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI
import Charts
struct SiteView: View {
    @EnvironmentObject var vm: MapViewModel
    @StateObject var eskomApi = EskomApi()
    @State var provinceName: String = "Province"
    var sitesApi = SitesApi()
    var body: some View {
        ScrollView {
            VStack {
                TopSection()
                    .padding(.vertical)
                ChartView()
//                Divider()
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
        ZStack{
            RoundedRectangle(cornerRadius: 15,style: .continuous)
                .frame(width: 380, height: 280)
                .foregroundColor(.white)
            Chart{
                ForEach(vm.sites[0].week, id: \.self){ item in
                    LineMark(x: .value("Days of the week", item.days),
                             y: .value("Hours", item.hours))
                }.foregroundStyle(.red)
                    
            }
//            .chartForegroundStyleScale([
//                "Stage 1 - 2": .green,
//                "Stage 3 - 4": .yellow,
//                "Stage 5 - 6": .orange,
//                "Stage 7 - 8": .red,
//            ])
            .padding()
        }
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
//        .background{
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(lineWidth: 1)
//        }
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
