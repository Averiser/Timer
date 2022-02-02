//
//  AnnounceModel.swift
//  Timer
//
//  Created by MyMacBook on 31.01.2022.
//

import UIKit
import AVFoundation

private let SOUND_FILE_NAME = "Ann_custom_timer_"

final class AnnounceModel {
  var announcer = Announcer()
  var soundEffect: AVAudioPlayer?
  var displayTime: Int?
  var currentTimer: Int  {
    return UserDefaults.standard.integer(forKey: "timerTag") - 1
  }
  
  var temp: Int = -1
  
  init() {
    soundEffect = AVAudioPlayer()
  }
  
  func playSound(displayTime: Int) {
    if self.displayTime != displayTime {
      self.displayTime =  displayTime
    }
    
    if announcer.remaining[currentTimer].contains(displayTime) {
      temp = displayTime
      
      guard let path = Bundle.main.path(forResource: SOUND_FILE_NAME + String(displayTime), ofType: "mp3") else {
        return
      }
      let url = URL(fileURLWithPath: path)

      do {
          soundEffect = try AVAudioPlayer(contentsOf: url)
          soundEffect?.prepareToPlay()
          soundEffect?.play()
      } catch {
          fatalError("couldn't load file")
      }
      return
  }
    
    if announcer.countdown[currentTimer].contains(displayTime) {

        //countdown will not interrupt remaining
        if announcer.remaining[currentTimer].contains(displayTime + 1) && temp != -1 {
            return
        }

        guard let path = Bundle.main.path(forResource: "Ann_custom_countdown_" + String(displayTime), ofType: "mp3") else {
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.prepareToPlay()
            soundEffect?.play()
        } catch {
            fatalError("couldn't load file")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  }
}
