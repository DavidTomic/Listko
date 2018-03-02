//
//  App.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit
import Moya
import MoyaSugar
import KeychainSwift

class App {

  static let keychain = KeychainSwift()
  static let jsonWorkerApp = JsonWorker()
  
  static var delegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  static var rest: MoyaSugarProvider<ListkoApi> {
    return delegate.provider
  }
  
  static var user: User {
    return User.getInstance()
  }
  
  static var jsonWorker: JsonWorker {
    return jsonWorkerApp
  }
}
