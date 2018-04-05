//
//  SettingsPresenter.swift
//  Listko
//
//  Created by David Tomic on 05/04/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SettingsPresentationLogic
{
   func presentItems(response: Settings.Get.Response)
}

class SettingsPresenter: SettingsPresentationLogic
{
  weak var viewController: SettingsDisplayLogic?
  
   func presentItems(response: Settings.Get.Response)
  {
    let viewModel = Settings.Get.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
