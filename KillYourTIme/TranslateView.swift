//
//  SwiftUIView.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/08.
//

import SwiftUI
import Alamofire

struct DeepLResult: Codable {
    let translations: [Translation]
    struct Translation: Codable {
        var detected_source_language: String
        var text: String
    }
}

struct TranslateView: View {
    @State private var originalText = ""
    @State private var translatedText = ""
    @StateObject var speech = Speecher()
    let decoder: JSONDecoder = JSONDecoder()
    let phrase: String
    
    func translation() {
                originalText = phrase
                print("??????", originalText)
                let authKey = KeyManager().getValue(key: "DeepLAuthKey") as! String
                let parameters: [String: String] = [
                        "text": originalText,
                        "target_lang": "JA",
                        "auth_key": authKey
                ]
                let headers: HTTPHeaders = [
                        "Content-Type": "application/x-www-form-urlencoded"
                ]
                AF.request("https://api-free.deepl.com/v2/translate", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseDecodable(of: DeepLResult.self) { response in
                        if case .success = response.result {
                                do {
                                        let result = try decoder.decode(DeepLResult.self, from: response.data!)
                                        translatedText =  result.translations[0].text
                                } catch {
                                        debugPrint("デコード失敗")
                                }
                        } else {
                                debugPrint("APIリクエストエラー")
                        }
                }
    }

    var body: some View {
        NavigationView{
            ZStack {
                Image("books")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            VStack(spacing:0) {
                HStack{
                Button(action: {
                    translation()
                }, label: {
                    Text("英→日")
                        .foregroundColor(Color .white)
                        .font(.system(size: 30, weight: .heavy))
                })
                Button(action: {speech.speeche(text: phrase)}, label: {
                    Text("💡")
                        .font(.title)
                })
                }
                Text((phrase ?? "") as String)
                    .frame(width: 320)
                .padding()
                .background(Color("backgroundText"))
                
                Text((translatedText ?? "") as String)
                    .frame(width: 320)
                .padding()
                .background(Color("backgroundText"))
                Spacer()
            }
        }
        }
    }
}

//struct TranslateView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
