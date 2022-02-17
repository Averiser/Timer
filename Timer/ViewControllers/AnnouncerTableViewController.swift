//
//  AnnouncerTableViewController.swift
//  Timer
//
//  Created by MyMacBook on 17.02.2022.
//

import UIKit

class AnnouncerTableViewController: UITableViewController {

    var announcer: Announcer?
    var selectedTimer: Int?
    let countdown: [String] = ["Overtime", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    let remaining: [Int: String] = [5: "Five seconds remaining", 10: "Ten seonds remaining", 15: "Fifteen sconds remaining", 30: "Thirty sconds remaining", 120: "Two minutes remaining", 180: "Three minutes remaining", 240: "Four minutes remaining", 300: "Five minutes remaining", 600: "Ten minutes remaining", 900: "Fifteen minutes remaining"]
    var remainingTime = [Int]()
    var numOfSection = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(class: SwitchTableViewCell.self)
        tableView.register(class: AnnouncerTableViewCell.self)

        remainingTime = Array(remaining.keys)
        remainingTime.sort(by: <)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numOfSection
    }
}
