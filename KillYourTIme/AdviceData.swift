//
//  JokeData.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/05.
//

import Foundation
import UIKit
//import SwiftyJSON
//
//struct ResultData: Identifiable {
//    let id = UUID()
//    let advice: String
//}

class AdviceData: ObservableObject {
    
//    struct ResultJson: Codable {
//        struct slip: Codable{
//            let id : Int
//            let advice: String
//        }
//        let results = [results]
//    }
    
    
//    @Published var resultList: [ResultData]?
    
    func getAdvice() async {
        let url = URL(string: "https://api.adviceslip.com/advice")!
        let request = URLRequest(url: url )
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in guard let data = data else { return }
            do {
                let object = try JSONSerialization.jsonObject(with: data, options:[])
               // printには出せるけどobjectにアクセスできない
//                let decoder: JSONDecoder = JSONDecoder()
//                let json = try decoder.decode(ResultJson.self, from: data)
                print(object)
                let dic: Dictionary = object as! Dictionary<String, AnyObject>
                print(dic)
            
//                print(json)
//                print(json)
               
            } catch let error{
                print(error)
            }
        }
        task.resume()
         
        /*
        do {
        guard let req_url = URL(string: "https://api.adviceslip.com/advice") else { return }
        let (data , _) = try await URLSession.shared.data(from: req_url)
        let decoder: JSONDecoder = JSONDecoder()
        guard let resultJson: ResultJson = try? decoder.decode(ResultJson.self, from: data) else { return }
            
        } catch let error{
            print(error)
        }
         */
    }
    
}
