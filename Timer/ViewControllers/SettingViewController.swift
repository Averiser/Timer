//
//  SettingViewController.swift
//  Timer
//
//  Created by MyMacBook on 07.02.2022.
//

import UIKit

class SettingViewController: UIViewController {
    struct Timer {
        var name: String
        var time: Int = 0
        var vibrate: Bool?
        var sound: String?
        var announce = [String]()
        var setting: UserDefaults
    }
    var screenLock = ScreenLock()
    var announcer = Announcer()
    @IBOutlet weak var t1Button: UIButton!
    @IBOutlet weak var t2Button: UIButton!
    @IBOutlet weak var t3Button: UIButton!
    @IBOutlet weak var soundSettingTable: UITableView!
    @IBOutlet weak var timePickView: TimePickerView!
    let t1settings = UserDefaults(suiteName: "t1")
    let t2settings = UserDefaults(suiteName: "t2")
    let t3settings = UserDefaults(suiteName: "t3")
    var t1Time: Int = 0
    var t2Time: Int = 0
    var t3Time: Int = 0
    var selectedTimerButton: UIButton!
    var timerKeys: [String] = ["t1", "t2", "t3"]
    var timers = [Timer]()
    var selectedTimer: Int = 0
    var selectedButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromDefaults()
        t1Time = (t1settings?.integer(forKey: "time"))!
        t2Time = (t2settings?.integer(forKey: "time"))!
        t3Time = (t3settings?.integer(forKey: "time"))!
        soundSettingTable.separatorColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        timePickView.delegate = self
        setPickerValue(timerNum: 0)
        selectedButton = t1Button
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //refresh lock and announcer table
        soundSettingTable.reloadData()
        //Change timePickerView seperator lines to white
        if timePickView.subviews.count >= 5 {
            timePickView.subviews[5].backgroundColor = UIColor.white
            timePickView.subviews[4].backgroundColor = UIColor.white
        }
    }

    @IBAction func timerButtonsTouchUpInside(_ sender: UIButton) {
        selectedButton?.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        selectedButton?.isUserInteractionEnabled = true
        selectedTimerButton = sender
        let timerNum: Int = sender.tag - 1
        setPickerValue(timerNum: timerNum)
        selectedButton = sender
        selectedTimer = timerNum
        sender.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        sender.isUserInteractionEnabled = false
        sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .highlighted)
        soundSettingTable.reloadData()
    }

    @IBAction func leftUIBarAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func rightUIBarAction(_ sender: UIBarButtonItem) {
        for timer in timers {
            print("seting time")
            print(timer.time)
            let setting = timer.setting
            setting.set(timer.time, forKey: "time")
            setting.set(timer.vibrate, forKey: "vibrate")
            setting.set(timer.sound, forKey: "sound")
            setting.set(timer.announce, forKey: "announce")
        }
        screenLock.saveLocks()
        announcer.saveAnnouncers()
        self.dismiss(animated: true, completion: nil)
    }

    func loadFromDefaults() {
        for timerKey in timerKeys {
            print(timerKey)
            let setting = UserDefaults(suiteName: timerKey)
            let time = setting?.integer(forKey: "time")
            let vibrate = setting?.bool(forKey: "vibrate")
            let sound = setting?.string(forKey: "sound")
            let announce = [String]()
            let oneTimer: Timer = Timer(name: timerKey, time: time!, vibrate: vibrate, sound: sound, announce: announce, setting: setting!)
            timers.append(oneTimer)
        }
        let textTimer = NSLocalizedString("Timer", comment: "")
        t1Button.setTitle(" " + textTimer + " " + "1" + ":  " + timers[0].time.convertTotalToSetting(), for: .normal)
        t2Button.setTitle(" " + textTimer + " " + "2" + ":  " + timers[1].time.convertTotalToSetting(), for: .normal)
        t3Button.setTitle(" " + textTimer + " " + "3" + ":  " + timers[2].time.convertTotalToSetting(), for: .normal)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "screenLock" {
            if let viewController = segue.destination as? LockTableViewController {
                viewController.screenLock = self.screenLock
            }
        } else if segue.identifier == "announcer" {
            if let viewController = segue.destination as? AnnouncerTableViewController {
                viewController.announcer = announcer
                viewController.selectedTimer = selectedTimer
            }
        }
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if timePickView.subviews.count >= 5 {
            timePickView.subviews[5].backgroundColor = UIColor.white
            timePickView.subviews[4].backgroundColor = UIColor.white
        }
    }
}
