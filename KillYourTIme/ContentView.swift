//
//  ContentView.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/05.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    @State var str: String = "The Word is what you want in your life"
    @StateObject var adviceData = AdviceData()
    @StateObject var pascalData = PascalData()
    @StateObject var jokeData = JokeData()
    @StateObject var quotoData = QuotoData()
    @StateObject var shareTwitter = ShareTwitter()
    @StateObject var speech = Speecher()
    @StateObject var favorite = Favorite()
    @State private var showingAlert = false
    @StateObject var buzz = BuzzData()
   
    var body: some View {
        NavigationView {
        ZStack {
            Image("light")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        VStack {
        Text(str)
                .font(.system(.body, design: .serif))
                .italic()
                .frame(width: 320)
                .foregroundColor(Color.black)
            .padding()
            .background(Color("backgroundText"))
            HStack {
                Button(action: {
                    Task {
                                  await adviceData.getAdvice()
                        let _quoto = quotoData.getQuoto()
                        let _buzzWord = await buzz.getBuzz()
                        let _pascalPhrase = pascalData.getPascal()
                        let _jokePhrase = jokeData.getJoke()
                        let num = Int.random(in: 1..<8)
                                    if num == 3 {
                                        str = _jokePhrase
                                    } else if num == 5{
                                        str = _buzzWord
                                    }
                        else if num == 6{
                                        str = _pascalPhrase
                        } else {
                            str = _quoto
                        }
                                    }
                    
                          }
                       ) {
                    Text("GET")
                        .foregroundColor(Color .white)
                        .font(.system(size: 30, weight: .heavy))
                }
                
     Button(action: {
                    speech.speeche(text: str)
                }) {
                    Text("📢")
                        .frame(width: 35, height: 35)
                        .background(Color("sound"))
                        .clipShape(Circle())
    
                }
                Button(action: {
                    favorite.addFav(text: str)
                    print(type(of:favorite.favList))
                    showingAlert = true
                }
                ) {
                    Text("❤️‍🔥")
                        .frame(width: 35, height: 35)
                        .background(Color("favorite"))
                        .clipShape(Circle())

                }
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Add Phrase to Favoirte List"),
                          dismissButton: .default(Text("OK")))
                })
                
            }
            HStack {
            Button(action: {
                shareTwitter.share(phrase: str)
            }) {
                Text("Twitter")
                    .foregroundColor(Color .white)
                    .frame(width: 70, height: 30)
                    .background(Color("twitter"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        }
        }
        .toolbar {
            let items = favorite.pickText()
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: FavListView(item: items)) {
                    Text("Favorite List")
                        .foregroundColor(Color .white)
                }
            }
        }
  }
        .navigationViewStyle(StackNavigationViewStyle())
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

