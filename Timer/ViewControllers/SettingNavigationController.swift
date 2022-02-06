//
//  SettingNavigationController.swift
//  Timer
//
//  Created by MyMacBook on 06.02.2022.
//

import UIKit

class SettingNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return super.supportedInterfaceOrientations
        }
        return.portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return super.preferredInterfaceOrientationForPresentation
        }
        return.portrait
    }

}
