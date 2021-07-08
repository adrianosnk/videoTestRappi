//
//  AlertViewHelper.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class AlertViewHelper {
  
  func showSimpleAlert(title: String,
                       message: String,
                       style: UIAlertController.Style = .alert) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: { _ in
      //Cancel Action
    }))
    return alert
  }
  //    self.present(alert, animated: true, completion: nil)
}
