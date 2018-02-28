//
//  MyAlamofireManager.swift
//  Neostar
//
//  Created by David Tomic on 12/10/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation
import Alamofire

class MyAlamofireManager {
  static let sharedManager: Alamofire.SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 15 // as seconds, you can set your request timeout
    configuration.timeoutIntervalForResource = 15 // as seconds, you can set your resource timeout
    configuration.requestCachePolicy = .useProtocolCachePolicy
    return Alamofire.SessionManager(configuration: configuration)
  }()
}
