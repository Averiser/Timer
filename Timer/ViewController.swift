//
//  ViewController.swift
//  Timer
//
//  Created by MyMacBook on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {

  var ourTimer = Timer()
  var timerDisplayed = 0
  
  @IBOutlet weak var label: UILabel!
  
  @IBAction func startBTN(_ sender: Any) {
    ourTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
  }
  
  @IBAction func pauseBTN(_ sender: Any) {
    ourTimer.invalidate()
  }
  
  @IBAction func resetBTN(_ sender: Any) {
    ourTimer.invalidate()
    timerDisplayed = 0
    label.text = "0"
  }
  
  @objc func Action() {
    timerDisplayed += 1
    label.text = String(timerDisplayed)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

