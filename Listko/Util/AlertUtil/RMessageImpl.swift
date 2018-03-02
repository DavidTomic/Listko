//
//  RMessageImpl.swift
//  Neostar
//
//  Created by David Tomic on 23/06/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation
import RMessage

class RMessageImpl: NSObject, AlertProtocol {
  
  func showAlert(title: String, subTitle: String?, type: AlertType) {
    
    var alertType = RMessageType.error
    if type == .success { alertType = RMessageType.success }
    if type == .warning { alertType = RMessageType.warning }

    RMessageView.appearance().titleSubtitleLabelsSizeToFit = subTitle != nil ? false : true
    
    RMessage.showNotification(withTitle: title, subtitle: subTitle, type: alertType, customTypeName: nil, callback: nil)
  }
}
