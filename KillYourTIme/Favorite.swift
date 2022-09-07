//
//  favorite.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import Foundation
import UIKit

struct FavItem : Identifiable {
    let id = UUID()
    let phrase : String
}

class Favorite: ObservableObject {
    @Published var favList: [FavItem] = []
    
    func addFav(text: String) {
//        self.favList.removeAll()
        let phrase = text
        let fav = FavItem(phrase: phrase)
        self.favList.append(fav)
        print(self.favList)
    }
    
    func pickText() -> [String] {
        var texts: [String] = []
        for obj in self.favList {
            texts.append(obj.phrase)
        }
        return texts
    }
}

