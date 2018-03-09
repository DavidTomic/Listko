//
//  ShowListViewController.swift
//  Listko
//
//  Created by David Tomic on 08/03/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ShowListDisplayLogic: class
{
  func displaySomething(viewModel: ShowList.Something.ViewModel)
}

class ShowListViewController: UIViewController, ShowListDisplayLogic
{
  var interactor: ShowListBusinessLogic?
  var router: (NSObjectProtocol & ShowListRoutingLogic & ShowListDataPassing)?

  let popupDismissAnimationController = PopupDismissAnimationController()
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    print("viewDidLoad")
    doSomething()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("viewDidLayoutSubviews")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
  }
  
  deinit {
    print("deinit")
  }
  
  // MARK: Action
  
  @IBAction func cancel(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func close(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = ShowList.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ShowList.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}