//
//  JsonWorker.swift
//  Neostar
//
//  Created by David Tomic on 19/06/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation
import Moya
import Gloss
import Moya_Gloss
import Result

/**
 Status code and failure errors are logged with MoyaPlugin
 */
class JsonWorker {
  
  func handleJsonObject<T: JsonDecodableProtocol>(result: (Result<Response, MoyaError>), success: @escaping (T) -> (), failure: @escaping (AppError) -> ()) {
    switch result {
    case .success(let response):
      if response.statusCode == 200 {
        do {
          let object = try response.mapObject(T.self)
          success(object)
        } catch {
          failure(.parseObjectError)
          logJsonParseError(response: response)
        }
      } else {
        failure(.responseError(parseJsonMessage(response: response)))
      }
    case .failure(_):
      failure(.networkFailure)
    }
  }
  
  func handleJsonArray<T: JsonDecodableProtocol>(result: (Result<Response, MoyaError>), success: @escaping ([T]) -> (), failure: @escaping (AppError) -> ()) {
    switch result {
    case .success(let response):
      if response.statusCode == 200 {
        do {
          let array = try response.mapArray(T.self)
          success(array)
        } catch {
          failure(.parseObjectError)
          logJsonParseError(response: response)
        }
      } else {
        failure(.responseError(parseJsonMessage(response: response)))
      }
    case .failure(_):
      failure(.networkFailure)
    }
  }
  
  func handleParametersResponse(result: (Result<Response, MoyaError>), success: @escaping ([String: Any]) -> (), failure: @escaping (AppError) -> ()) {
    switch result {
    case .success(let response):
      if response.statusCode == 200 {
        if let parameters = convertToDictionary(data: response.data) {
          success(parameters)
        } else {
          failure(.parseObjectError)
          logJsonParseError(response: response)
        }
      } else {
        failure(.responseError(parseJsonMessage(response: response)))
      }
    case .failure(_):
      failure(.networkFailure)
    }
  }
  
  func handleEmptyResponse(result: (Result<Response, MoyaError>), success: @escaping () -> (), failure: @escaping (AppError) -> ()) {
    switch result {
    case .success(let response):
      if response.statusCode == 200 {
        success()
      } else {
        failure(.responseError(parseJsonMessage(response: response)))
      }
    case .failure(_):
      failure(.networkFailure)
    }
  }
  
  
  ////////////////////
  private func logJsonParseError(response: Response) {
    Logger.logError(type: .parseObjectError, info: MyMoyaPlugin.getInfoParameters(response: response))
  }
  
  private func parseJsonMessage(response: Response) -> String? {
    do {
      let object = try response.mapObject(JsonErrorMessage.self)
      return object.message
    } catch {
      return nil
    }
  }
  
  struct JsonErrorMessage: JsonDecodableProtocol {
    var message: String
    
    init?(json: JSON){
      guard let message: String = "message" <~~ json else {
        return nil
      }
      self.message = message
    }
  }
  
  func convertToDictionary(data: Data) -> [String: Any]? {
    do {
      return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
      return nil
    }
  }
}
