//
//  ViewController.swift
//  Listko
//
//  Created by David Tomic on 20/02/2018.
//  Copyright © 2018 Terminko. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func clearNavBarBackground() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//    self.navigationController?.navigationBar.shadowImage = UIImage()
//    self.navigationController?.navigationBar.isTranslucent = true
//    self.navigationController?.view.backgroundColor = UIColor.clear
//    self.navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
}

