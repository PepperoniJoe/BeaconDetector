//
//  VoiceSynthesizer.swift
//  BeaconDetector
//
//  Created by Marcy Vernon on 1/2/21.
//

import AVFoundation

class VoiceSynthesizer: ObservableObject {
    
    let synth  = AVSpeechSynthesizer()
    var speech = AVSpeechUtterance(string: String())
    
    func say(speaker: EnglishSpeakers, phrase: String, rate: Float = 0.5, pitch: Float = 1) {
        speech = AVSpeechUtterance(string: phrase)
        speech.rate = rate // 0.5 default
        speech.pitchMultiplier = pitch // 0.9 // [0.5 - 2] Default = 1
        speech.voice = AVSpeechSynthesisVoice(identifier: speaker.rawValue)
   //     speech.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_en-AU_compact")
        synth.speak(speech)
    }
    
    func stop() {
        synth.stopSpeaking(at: .immediate)
    }
}

