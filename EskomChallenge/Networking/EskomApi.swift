//
//  EskomApi.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation

class EskomApi{
    var areaData: Areas?
    var eventData: Events?
    let token: String = "YVKYuUQ2ZjDFXGxztCeA"
//    let lat: Float = -26.0269658
//    let lon: Float = 28.0137339
    
    let lat: Float = -33.918861
    let lon: Float = 18.423300

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
                    id = self.areaData?.areas[0].id ?? ""
                    print(id)
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
                    print(self.eventData?.events[0].start ?? "")
                    print(self.eventData?.events[0].note ?? "")
                    print(self.eventData?.events[0].end ?? "")
                }
            }catch let error{
                print(error)
            }
        }
        .resume()
    }
}
