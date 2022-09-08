# Swift project in ITI Polyglottal

Kill-Your-Time App made by JS(https://github.com/Kiki-her/kill-your-time) to iOS app

## アプリ概要

JS で実装した Joke アプリの Swift 改良版。GET ボタンでパスカルの言葉か、Joke か、もしくは特に意味のない言葉が画面に表示される。📢 ボタンでその言葉が読み上げられて、❤️‍🔥 ボタンで Favorite List に追加される(現在は配列に追加。後日 DB 実装予定)。画面右上の”Favorite List”をタップすると画面遷移し、❤️‍🔥 ボタンで追加した言葉のリストが表示される。
また、それぞれの言葉の左側にある 💡 ボタンを押すと読み上げが、">"を押すと画面遷移する。遷移先はその言葉が表示されていて、”英 → 日”ボタンを押すと日本語に翻訳された文が下に表示される。💡 ボタンを押すと英文が読み上げられる。

## 使用 API

- [ ] Officail Joke API (https://github.com/Kiki-her/official_joke_api)
- [ ] Bullshit/Buzzword Generator API (https://github.com/sameerkumar18/corporate-bs-generator-api)
- [ ] Advice Slip JSON API (https://api.adviceslip.com/#endpoint-random)

## 使用技術

- [ ] Swift
- [ ] XCode
- [ ] SwiftUI
- [ ] Alamofire
- [ ] AVFoundation
