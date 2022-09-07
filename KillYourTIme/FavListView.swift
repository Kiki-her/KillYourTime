//
//  FavListView.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import SwiftUI


struct FavListView: View {
    let item: [String]
    var body: some View {
//        Text(item[0])
        if item.count > 0 {
            List(0 ..< item.count) {
                fav in
                HStack {
                    Text("💡")
                    Text(item[fav])
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

