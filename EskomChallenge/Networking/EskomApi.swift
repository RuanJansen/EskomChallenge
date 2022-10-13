//
//  EskomApi.swift
//  EskomChallenge
//
//  Created by Ruan Jansen on 2022/10/11.
//

import Foundation
//#if canImport(FoundationNetworking)
//import FoundationNetworking
//#endif
//class EskomApi{
//    func getAreas(){
//        let token: String = "YVKYuUQ2ZjDFXGxztCeA"
//            let lat: Float = -26.0269658
//            let lon: Float = 28.0137339
//            let id: String = "eskde-10-fourwaysext10cityofjohannesburggauteng"
//        let urlAreas: String = "https://developer.sepush.co.za/business/2.0/areas_nearby?lat=\(lat)&lon=\(lon)"
//        var semaphore = DispatchSemaphore (value: 0)
//
//        var request = URLRequest(url: URL(string: urlAreas)!,timeoutInterval: Double.infinity)
//        request.httpMethod = "GET"
//        request.setValue(token, forHTTPHeaderField: "token")
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            semaphore.signal()
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//          semaphore.signal()
//        }
//
//        task.resume()
//        semaphore.wait()
//    }
//}





class EskomApi{
    var areaData: Areas?
    let token: String = "YVKYuUQ2ZjDFXGxztCeA"
    let lat: Float = -26.0269658
    let lon: Float = 28.0137339
    let id: String = "eskde-10-fourwaysext10cityofjohannesburggauteng"

    func getAreas(){
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
                DispatchQueue.main.async {
                    self.areaData = decodedData
                    print(self.areaData?.areas[0].id ?? "")
                }
            }catch let error{
                print(error)
            }
        }
            .resume()
    }

    func getEvents(){
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
                let decodedData =  try JSONDecoder().decode(Event.self, from: data)
                DispatchQueue.main.async {
//                    self.zones = decodedData
                    print(decodedData)
                }
            }catch let error{
                print(error)
            }
        }
        .resume()

    }


}
