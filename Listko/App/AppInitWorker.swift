//
//  AppInitWorker.swift
//  Listko
//
//  Created by David Tomic on 27/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import Firebase
import Moya
import MoyaSugar
import RealmSwift

class AppInitWorker: NSObject {
  
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
  
  func initRealm() -> Realm {
    return try! Realm()
  }
  
  func setCustomBackButton() {
    let navigationBarAppearace = UINavigationBar.appearance()
    let barButtonAppearace = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
    
    let backImage = #imageLiteral(resourceName: "back")
    navigationBarAppearace.backIndicatorImage = backImage
    navigationBarAppearace.backIndicatorTransitionMaskImage = backImage
    
    barButtonAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -7), for: .default)
  }
}
