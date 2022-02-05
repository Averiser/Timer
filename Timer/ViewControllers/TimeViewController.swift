//
//  ViewController.swift
//  Timer
//
//  Created by MyMacBook on 28.01.2022.
//

import UIKit
import AVFoundation

class TimeViewController: UIViewController {
  
  
  @IBOutlet var timeBackground: UIView!
  @IBOutlet weak var display: UILabel!
  
  @IBOutlet weak var t1Button: UIButton!
  @IBOutlet weak var t2Button: UIButton!
  @IBOutlet weak var t3Button: UIButton!
  
  var sound = AnnounceModel()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      setButtonLabels()

      self.navigationController?.navigationBar.isTranslucent = true

      //Remove line between Navigationbar and View
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      self.navigationController?.navigationBar.shadowImage = UIImage()

      //Add gesture to MainLabel
      let tapLabel: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resetTime))
      tapLabel.delegate = self
      mainLabel.isUserInteractionEnabled = true
      mainLabel.addGestureRecognizer(tapLabel)

      //Add gesture to UINavigationBar title
      let tapTitle: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resetTime))
      tapTitle.delegate = self
      self.navigationItem.titleView = resetLabel
      self.navigationItem.titleView?.isUserInteractionEnabled = true
      self.navigationItem.titleView?.addGestureRecognizer(tapTitle)

      //Default MainLabel
      display.font = display.font.withSize(500)
      display.text = ""
      display.minimumScaleFactor = 0.01
      display.adjustsFontSizeToFitWidth = true
      display.sizeToFit()

      //Update display when defaults change
      NotificationCenter.default.addObserver(self, selector: #selector(TimeViewController.setButtonLabels), name: UserDefaults.didChangeNotification, object: nil)
      restoreStatus()
  }
  
  
//  var ourTimer = Timer()
//  var timerDisplayed = 0
//
//  @IBOutlet weak var label: UILabel!
//
//  @IBAction func startBTN(_ sender: Any) {
//    ourTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
//  }
//
//  @IBAction func pauseBTN(_ sender: Any) {
//    ourTimer.invalidate()
//  }
//
//  @IBAction func resetBTN(_ sender: Any) {
//    ourTimer.invalidate()
//    timerDisplayed = 0
//    label.text = "0"
//  }
//
//  @objc func Action() {
//    timerDisplayed += 1
//    label.text = String(timerDisplayed)
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//  }
//
//
}

