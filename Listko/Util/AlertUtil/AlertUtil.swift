//
//  AlertUtil.swift
//  Neostar
//
//  Created by David Tomic on 23/06/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import UIKit


enum AlertType {
  case error, success, warning
}

protocol AlertProtocol {
  func showAlert(title: String, subTitle: String?, type: AlertType)
}

class AlertUtil {
  private static let alertImpl: AlertProtocol = RMessageImpl()
  
  static func showAlert(title: String, subTitle: String?, type: AlertType) {
    alertImpl.showAlert(title: title, subTitle: subTitle, type: type)
  }
  
  static func showError(_ error: String?) {
    if let error = error {
      alertImpl.showAlert(title: error, subTitle: nil, type: .error)
    } else {
      alertImpl.showAlert(title: "defualt_error", subTitle: "check_internet_connection", type: .error)
    }
  }
}
