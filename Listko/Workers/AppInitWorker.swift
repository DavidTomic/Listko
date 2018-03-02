//
//  AppInitWorker.swift
//  Listko
//
//  Created by David Tomic on 27/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import SharkORM
import Firebase
import Moya
import MoyaSugar

class AppInitWorker: NSObject, SRKDelegate {
  
  func initSharkORM() {
    SharkORM.setDelegate(self)
    SharkORM.openDatabaseNamed("listko_db")
  }
  
  func initFirebase() {
    var filePath: String!
    #if DEBUG
      filePath = Bundle.main.path(forResource: "GoogleService-Info-dev", ofType: "plist")
    #else
      filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
    #endif
    
    let firebaseOptions = FirebaseOptions(contentsOfFile: filePath)
    FirebaseApp.configure(options: firebaseOptions!)
  }
  
  func initVersionString() -> String {
    return (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? ""
  }
  
  func initNetworkProvider() -> MoyaSugarProvider<ListkoApi> {
    var plugins = [PluginType]()
    let loggingPlugin = NetworkLoggerPlugin(verbose: true)
    plugins.append(loggingPlugin)
    let myMoyaPlugin = MyMoyaPlugin()
    plugins.append(myMoyaPlugin)
    let networkActivityPlugin = NetworkActivityPlugin { (changeType, targetType) in
      var state = false
      if changeType == .began {
        state = true
      }
      UIApplication.shared.isNetworkActivityIndicatorVisible = state
    }
    plugins.append(networkActivityPlugin)
    
    #if DEBUG
      return MoyaSugarProvider<ListkoApi>(stubClosure: MoyaProvider.delayedStub(1), manager: MyAlamofireManager.sharedManager, plugins: plugins)
    #else
      return MoyaSugarProvider<ListkoApi>(manager: MyAlamofireManager.sharedManager, plugins: plugins)
    #endif
  }
  
  func initFabric() {
    Fabric.with([Crashlytics.self])
  }
  
}
