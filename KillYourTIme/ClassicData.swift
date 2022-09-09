//
//  ClassicData.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/09.
//

import Foundation
import SwiftUI

class ClassicData : ObservableObject {
    func getQuoto() -> String{
        
            guard let url = Bundle.main.url(forResource: "classic", withExtension: "json") else {
                fatalError("ファイルが見つからない")
            }
            guard let data = try? Data(contentsOf: url) else {
                fatalError("ファイル読み込みエラー")
            }
            let decoder = JSONDecoder()
            guard let phrases = try? decoder.decode([String].self, from:data) else {
                fatalError("JSON読み込みエラー")
            }
            let index = Int(arc4random()) % phrases.count
           return phrases[index]
    }
}
