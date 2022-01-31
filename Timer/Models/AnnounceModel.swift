//
//  AnnounceModel.swift
//  Timer
//
//  Created by MyMacBook on 31.01.2022.
//

import UIKit
import AVFoundation

final class AnnounceModel {
  var announcer = Announcer()
  var soundEffect: AVAudioPlayer?
  var displayTime: Int?
  var currentTime: Int  {
    return UserDefaults.standard.integer(forKey: "timerTag") - 1
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
