//
//  JokeData.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import Foundation

class JokeData: ObservableObject {
    struct Joke: Codable {
        let id: Int
        let type: String
        let setup: String
        let punchline: String
    }
    func getJoke() -> String{
        guard let url = Bundle.main.url(forResource: "joke", withExtension: "json") else {
            fatalError("ファイルが見つからない")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ファイル読み込みエラー")
        }
        let decoder = JSONDecoder()
        guard let jokes = try? decoder.decode([Joke].self, from:data) else {
            fatalError("JSON読み込みエラー")
        }
        let index = Int(arc4random()) % jokes.count
        let targetSetup = jokes[index].setup
        let targetPunchline = jokes[index].punchline
        return targetSetup + "--" + targetPunchline
    }
}
