//
//  PlaySound.swift
//  Cards UI
//
//  Created by José Javier Cueto Mejía on 10/05/20.
//  Copyright © 2020 Pozolx. All rights reserved.
//

import Foundation
import AVFoundation


//MARK: - audio player

var audioPlayer: AVAudioPlayer?



func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("archivo no reproducido")
        }
    }
    
}
