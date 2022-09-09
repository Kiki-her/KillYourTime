//
//  Speecher.swift
//  KillYourTIme
//
//  Created by 久島風音 on 2022/09/06.
//

import Foundation
import AVFoundation

class Speecher: ObservableObject {
    
    private var speechSynthesizer: AVSpeechSynthesizer!
    
    func speeche(text: String) {
        speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice  = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        utterance.pitchMultiplier = 1.0
        utterance.preUtteranceDelay = 0.2
        speechSynthesizer.speak(utterance)
    }
    func speecheJA(text: String) {
        speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice  = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = 0.4
        utterance.pitchMultiplier = 1.0
        utterance.preUtteranceDelay = 0.2
        speechSynthesizer.speak(utterance)
    }
}
