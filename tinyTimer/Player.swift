//
//  Player.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import AVFoundation

class Player {
    var player: AVAudioPlayer!
    
    func play() {
        let path = Bundle.main.path(forResource: "done_sound", ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        player.play()
    }
    
    func stop() {
        player.stop()
    }
}
