//
//  EskomApi.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation

class EskomApi: ObservableObject{
    var areaData: Areas?
    @Published var eventData: Events?
    @Published var currentStage: Int?
    let token: String = "9XkfgfwNk8QHTGEB44nd"
    
    let lat: Float = -33.918861
    let lon: Float = 18.423300
    
    init(areaData: Areas? = nil, eventData: Events? = nil) {
        self.areaData = areaData
        self.eventData = eventData
        getAreas()
    }
    
    func getAreas(){
        var id: String = ""
        let urlAreas: String = "https://developer.sepush.co.za/business/2.0/areas_nearby?lat=\(lat)&lon=\(lon)"
        
        guard let url = URL(string: urlAreas) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "token")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{ return }
            do{
                let decodedData =  try JSONDecoder().decode(Areas.self, from: data)
                DispatchQueue.main.async { [self] in
                    print("Call Areas")
                    self.areaData = decodedData
                    id = self.areaData?.areas[1].id ?? ""
                    getEvents(id: id)
                }
            }catch let error{
                print(error)
            }
        }
        .resume()
    }
    
    func getEvents(id: String){
        let urlEvents: String = "https://developer.sepush.co.za/business/2.0/area?id=\(id)&test=current"
        
        guard let url = URL(string: urlEvents) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "token")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{ return }
            do{
                let decodedData =  try JSONDecoder().decode(Events.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = decodedData
                    print("Call Events")
                    //Days are number of days and stages are the stages for that day                    
                }
            }catch let error{
                print(error)
            }
        }
        .resume()
    }
    
    func getLevels() -> [[String]]{
        //Get all the levels to print and maybe get
        let levels = eventData?.schedule.days.first?.stages ?? [[String]]()
        return levels
    }
    
    //Gets the stages from the events notes
    func getStageTimes(loadSheddingStage: Int = 1) -> [String]{
        // Get the stage were on for the first part of the 2d array
        let currentStage = eventData?.events.first?.note ?? ""
        let formattedStage = currentStage.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let stageNumber = (Int(formattedStage) ?? 0) - 1
        //we have the stage number
        // Display all the stage times for the stage
        let stageTimes = eventData?.schedule.days.first?.stages[loadSheddingStage]
        
        return stageTimes ?? [String]()
        //        for times in stageTimes ?? [String]() {
        //            return times
        //        }
        
    }
    
    func getStageTimes() -> [String]{
        // Get the stage were on for the first part of the 2d array
        let currentStage = eventData?.events.first?.note ?? ""
        let formattedStage = currentStage.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let stageNumber = (Int(formattedStage) ?? 0) - 1
        //we have the stage number
        // Display all the stage times for the stage
        let stageTimes = eventData?.schedule.days.first?.stages[stageNumber]
        return stageTimes ?? [String]()
    }
    
    //Get the days of the week for loadshedding
    func getDays() -> [String]{
        var emptyDay = [String]()
        let days = eventData?.schedule.days ?? [Day]()
        for day in days {
            emptyDay.append(day.name)
        }
        return emptyDay
    }
    
    func getDays() -> [Day]{
        let days = eventData?.schedule.days ?? [Day]()
        return days
    }
    
    func getStages(currentStage: Int = 1) {
        let days = eventData?.schedule.days ?? [Day]()
        for day in days {
            for stages in day.stages[1]{
                    print(stages)
            }
        }
    }
    
    func getCurrentStage(){
        // Get the stage were on for the first part of the 2d array
        let currentStage = eventData?.events.first?.note ?? ""
        let formattedStage = currentStage.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let stageNumber = (Int(formattedStage) ?? 0) - 1
        
        self.currentStage = stageNumber
    }
    
    func getCurrentStageValue() -> Int{
        // Get the stage were on for the first part of the 2d array
        let currentStage = eventData?.events.first?.note ?? ""
        let formattedStage = currentStage.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let stageNumber = (Int(formattedStage) ?? 0) - 1
        
        return stageNumber
    }
}





