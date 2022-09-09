//
//  FavListView.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import SwiftUI


struct FavListView: View {
    @StateObject var speech = Speecher()
    let item: [String]
    var body: some View {
        if item.count > 0 {
            List(0 ..< item.count) {
                fav in
                HStack {
                    Button(action: {
                        speech.speeche(text: item[fav])
                    }) {
                        Text("💡")
                    }
                    .buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: TranslateView(phrase: item[fav])) {
                        Text(item[fav])
                           
                    }
                }


            }.onAppear {
                UITableView.appearance().backgroundColor = UIColor.lightGray
            }
        } else {
                Text("Add Favorite Phrase")

        }
        
        
    }
}

//struct FavListView_Previews: PreviewProvider {
//    static var previews: some View {
////        FavListView(item: <#T##[String]#>)
//        FavListView(item: <#[String]#>)
//    }
//}

