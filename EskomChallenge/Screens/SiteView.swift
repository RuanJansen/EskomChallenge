//
//  SiteView.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import SwiftUI

struct SiteView: View {
    @StateObject var eskomApi = EskomApi()
//    @Binding var currentSite: Sites
    @EnvironmentObject var vm: MapViewModel
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
                Text(vm.currentSite.name)
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
            ForEach(eskomApi.eventData?.schedule.days ?? [Day(date: "1", name: "1", stages: [["1"], ["1"]])], id:\.self) { day in
                
                ScheduleRow(day: day).onAppear(){
                    print("DAY - \(day)")
                }
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
        }
    }
    
    @ViewBuilder
    func ScheduleRow(day: Day)-> some View{
        HStack(alignment: .top){
            Text(day.name)
                .bold()
            Spacer()
            VStack {
                ForEach(day.stages, id:\.self) { stage in
                    Text(stage.first ?? "")
                }
            }
        }
        .padding()
    }
}
//
//struct SiteView_Previews: PreviewProvider {
//    static var previews: some View {
//        SiteView()
//    }
//}
