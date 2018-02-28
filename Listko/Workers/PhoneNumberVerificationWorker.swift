//
//  PhoneNumberVerification.swift
//  Listko
//
//  Created by David Tomic on 27/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import Foundation
import FirebaseAuth

struct PhoneNumberVerificationWorker {
  
  func f() {
    let phoneNumber = "+385994794931"
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
      if let error = error {
        //self.showMessagePrompt(error.localizedDescription)
        return
      }
      // Sign in using the verificationID and the code sent to the user
      // ...
    }
  }
  
}
