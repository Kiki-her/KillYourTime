//
//  ShareTwitter.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import Foundation
import UIKit

class ShareTwitter: ObservableObject {
    func share(phrase: String) {
        let hashTag = "#KillYourTime"
        let completedText = phrase + "\n" + hashTag
        
        let encodedText  = completedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let encodedText = encodedText,
           let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
            UIApplication.shared.open(url)
        }
    }
}
