//
//  Presenter.swift
//  Neostar
//
//  Created by David Tomic on 05/10/2017.
//  Copyright © 2017 Autozubak. All rights reserved.
//

import Foundation

protocol PresenterProtocol {

}

extension PresenterProtocol {
  func presentError(error: AppError?) {
    AlertUtil.showError(error?.getErrorString())
  }
}
