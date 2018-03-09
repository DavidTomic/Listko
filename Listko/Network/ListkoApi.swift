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
  case getList()
  case sendList()
}

extension ListkoApi : SugarTargetType, AccessTokenAuthorizable {
  var route: Route {
    switch self {
    case .getList():
      return .get("lists")
    case .sendList():
      return .post("lists")
    }
  }
  
  var parameters: MoyaSugar.Parameters? {
    switch self {
      case .getList, .sendList:
      return nil
    }
  }
  
  var authorizationType: AuthorizationType {
    switch self {
      case .getList:
      return .basic
    default:
      return .none
    }
  }
  
  var baseURL: URL {
    return URL(string: Constants.Api.baseURL)!
  }
  
  var sampleData: Data {
    switch self {
    case .getList:
      if let url = Bundle.main.url(forResource: "list", withExtension: "json"),
        let data = try? Data(contentsOf: url) {
        return data
      }
    default:
      return Data()
    }
    return Data()
  }
  
  var headers: [String : String]? {
    return [
      "Accept": "application/json",
      "iOSVersion" : App.delegate.appVersionString
    ]
  }
}
