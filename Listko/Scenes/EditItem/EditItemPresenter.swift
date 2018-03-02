//
//  EditItemPresenter.swift
//  Listko
//
//  Created by David Tomic on 02/03/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EditItemPresentationLogic
{
  func presentSomething(response: EditItem.Something.Response)
}

class EditItemPresenter: EditItemPresentationLogic
{
  weak var viewController: EditItemDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: EditItem.Something.Response)
  {
    let viewModel = EditItem.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
