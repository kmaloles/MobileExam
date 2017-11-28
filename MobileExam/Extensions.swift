//
//  Extensions.swift
//  MobileExam
//
//  Created by Kevin Maloles on 11/28/17.
//  Copyright © 2017 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

extension UIViewController {
    func showLoading() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func hideLoading() {
        PKHUD.sharedHUD.hide()
    }
    
    func displayAlert(message: String, title: String = "Alert") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
}
