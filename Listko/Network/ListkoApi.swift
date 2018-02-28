//
//  ListkoApi.swift
//  Listko
//
//  Created by David Tomic on 28/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation

import Moya
import MoyaSugar
import Alamofire

enum ListkoApi {
  case getLists()
}

extension ListkoApi : SugarTargetType, AccessTokenAuthorizable {
  var route: Route {
    switch self {
    case .getLists():
      return .get("lists")
    }
  }
  
  var parameters: MoyaSugar.Parameters? {
    switch self {
      case .getLists():
      return nil
    }
  }
  
  var authorizationType: AuthorizationType {
    switch self {
      case .getLists:
      return .basic
    default:
      return .none
    }
  }
  
  var baseURL: URL {
    return URL(string: Constants.Api.baseURL)!
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var headers: [String : String]? {
    return [
      "Accept": "application/json",
      "iOSVersion" : App.delegate.appVersionString
    ]
  }
}
