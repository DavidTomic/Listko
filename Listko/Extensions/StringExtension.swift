//
//  StringExtension.swift
//  Listko
//
//  Created by David Tomic on 19/03/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import L10n_swift

extension String {
  
  var localized: String {
    return self.l10n()
  }
  
}
