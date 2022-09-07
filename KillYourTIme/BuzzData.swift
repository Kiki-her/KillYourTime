//
//  BuzzData.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/07.
//

import Foundation

class BuzzData: ObservableObject {
    struct ResultJson: Codable {
        let phrase: String
    }
    
    func getBuzz() async -> String{
    guard let req_url = URL(string: "https://corporatebs-generator.sameerkumar.website/") else {
        return "エラー"
    }
        do {
            let (data, _) = try await URLSession.shared.data(from: req_url)
            let decoder = JSONDecoder()
            let json = try decoder.decode(ResultJson.self, from: data)
            print(json)
            return json.phrase
        } catch {
            print("エラー")
            return "エラー"
        }
    }
}
