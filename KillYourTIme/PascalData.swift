//
//  getPascal.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import Foundation
import SwiftUI

class PascalData : ObservableObject {
    @AppStorage("phrase") var str = "The Word is what you want in your life"
    func getPascal() -> String{
        
            guard let url = Bundle.main.url(forResource: "pascal", withExtension: "json") else {
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
