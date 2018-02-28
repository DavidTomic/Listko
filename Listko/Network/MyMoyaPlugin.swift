//
//  AuthentificationPlugin.swift
//  Neostar
//
//  Created by David Tomic on 13/06/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation
import Moya
import Result
import SVProgressHUD

struct MyMoyaPlugin: PluginType {
  
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if (target as! AccessTokenAuthorizable).authorizationType == .none {
      return request
    }
    
    var request = request
    request.addValue(App.user.authToken ?? "", forHTTPHeaderField: "Authorization")
    return request
  }
  
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    SVProgressHUD.dismiss()
    
    switch result {
      case .success(let response):
        if response.statusCode != 200 {
          Logger.logError(type: .responseError(nil), info: MyMoyaPlugin.getInfoParameters(response: response) , code: response.statusCode)
        }
      break
      case .failure(let error):
        Logger.logError(type: .networkFailure, info: MyMoyaPlugin.getErrorInfoParameters(error: error), code: error.response?.statusCode ?? 0)
      break
    }
    
    if let response = result.value {
      if response.statusCode == 403 {
        App.delegate.logOut()
      }
    }
  }
  
  static func getInfoParameters(response: Response) -> [String: String] {
    var infoParameters = [String: String]()
    infoParameters["Request"] = response.request?.url?.absoluteString
    var requestParameters = getStringFromData(data: response.request?.httpBody)
    requestParameters = excludePasswordParameter(requestParameters: requestParameters)
    infoParameters["Request_Parameters"] = requestParameters
    infoParameters["Response"] = response.debugDescription
    infoParameters["ResponseData"] = getStringFromData(data: response.data)
    return infoParameters
  }
  
  private static func getErrorInfoParameters(error: MoyaError) -> [String: String] {
    var infoParameters = [String: String]()
    infoParameters["Request"] = error.response?.request?.url?.absoluteString
    var requestParameters = getStringFromData(data: error.response?.request?.httpBody)
    requestParameters = excludePasswordParameter(requestParameters: requestParameters)
    infoParameters["Request_Parameters"] = requestParameters
    infoParameters["Response"] = error.response?.debugDescription
    infoParameters["Error"] = error.errorDescription
    return infoParameters
  }
  
  private static func getStringFromData(data: Data?) -> String? {
    if let data = data {
      return String(data: data, encoding: .utf8)
    }
    return nil
  }
  
  private static func excludePasswordParameter(requestParameters: String?) -> String? {
    if let requestParameters = requestParameters {
      if requestParameters.lowercased().contains("password") {
        let array = requestParameters.split(separator: "&")
        var newArray = [String]()
        for item in array {
          if item.contains("password") {
            newArray.append("password=???")
          } else {
            newArray.append(String(item))
          }
        }
        return newArray.joined(separator: "&")
      }
    }
    return requestParameters
  }
}
