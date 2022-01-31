//
//  UserDefaultsModel.swift
//  Timer
//
//  Created by MyMacBook on 31.01.2022.
//

import UIKit

// MARK: List of Constants
private let TIMERS_NAMES: [String] = ["t1", "t2", "t3"]
private let TIME = "time"
private let ANNOUNCER = "announcer"
private let REMAINING = "remaining"
private let COUNT_DOWN = "countdown"
private let SCREEN_LOCK = "ScreenLock"
private let STOPWATCH_LOCK = "stopwatchLock"
private let DEFAULT_SETTING = "defaultSetting"


final class Announcer {
  var main = [Bool]()
  var remaining = [[Int]]()
  var countdown = [[Int]]()
  
  init() {
    var intArray = [Int]()
    for index in 0...2 {
      //load main switchers
      main.append(UserDefaults(suiteName: TIMERS_NAMES[index])?.bool(forKey: ANNOUNCER) ?? true)
      //load remaining
      intArray = UserDefaults(suiteName: TIMERS_NAMES[index])?.array(forKey: REMAINING) as? [Int] ?? [15, 30, 120, 180, 240, 300, 600, 900]
      remaining.append(intArray)
      //load countdown
      intArray = UserDefaults(suiteName: TIMERS_NAMES[index])?.array(forKey: COUNT_DOWN) as? [Int] ?? [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      countdown.append(intArray)
      
    }
  }
  
  
}
