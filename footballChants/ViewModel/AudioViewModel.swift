//
//  AudioViewModel.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 15.11.2023.
//

import Foundation
import AVKit

class AudioViewModel {
    private var chantAudioPlayer: AVAudioPlayer?
    
    func playback(for team: Team) {
        if team.isPlaying == false {
            chantAudioPlayer?.stop()
        } else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            
            let url = URL(fileURLWithPath: path)
            do {
                chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                chantAudioPlayer?.numberOfLoops = -1
                chantAudioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }
}
