//
//  EditGroceryViewControllerTests.swift
//  Listko
//
//  Created by David Tomic on 15/03/2018.
//  Copyright (c) 2018 Terminko. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Listko_dev
import XCTest

class EditGroceryViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: EditGroceryViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupEditGroceryViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupEditGroceryViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "EditGroceryViewController") as! EditGroceryViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class EditGroceryBusinessLogicSpy: EditGroceryBusinessLogic
  {
    var showGroceryListToEditCalled = false
    
    func showGroceryListToEdit(request: EditGrocery.Edit.Request)
    {
      showGroceryListToEditCalled = true
    }
  }
  
  class TableViewSpy: UITableView
  {
    // MARK: Method call expectations
    
    var reloadDataCalled = false
    
    // MARK: Spied methods
    
    override func reloadData()
    {
      reloadDataCalled = true
    }
  }
  
  // MARK: Test Edit Grocery
  
  func testShouldShowGroceryListToEditWhenViewIsLoaded()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.showGroceryListToEditCalled, "viewDidLoad() should ask the interactor to do showGroceryListToEdit")
  }
  
  func testDisplayEditedGroceryReloadTableView()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let tableViewSpy = TableViewSpy()
    sut.tableView = tableViewSpy
    
    // When
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: nil, displayedListItems: [:], sections: [])
    sut.displayEditedGrocery(viewModel: viewModel)
    
    // Then
    XCTAssert(tableViewSpy.reloadDataCalled, "displayEditedGrocery() should reload the table view")
  }
  
  func testDisplayEditedGroceryShowNewGroceryListCorrectly()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let sections = ["section1"]
    let displayedListItem = EditGrocery.DisplayedListItem(name: "")
    let displayedListItems = [sections[0]: [displayedListItem]]
    
    // When
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: nil, displayedListItems: displayedListItems, sections: sections)
    sut.displayEditedGrocery(viewModel: viewModel)
    
    // Then
    XCTAssertEqual(sut.tfGroceryName.text, "", "tfGroceryName should have empty Grocery name")
    XCTAssertEqual(sut.tableView.numberOfSections, 1, "tableview should have one section")
    XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1, "tableview should have one row in section")
  }
  
  func testDisplayEditedGroceryShowGroceryName()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let tableViewSpy = TableViewSpy()
    sut.tableView = tableViewSpy
    
    // When
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: "Grocery List", displayedListItems: [:], sections: [])
    sut.displayEditedGrocery(viewModel: viewModel)
    
    // Then
    XCTAssertEqual(sut.tfGroceryName.text, "Grocery List", "tfGroceryName should have empty Grocery name")
  }
  
  func testNumberOfSectionsEqaulNumberOfGroceryListCategoriesToDisplay()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let sections = ["section1", "section2"]
    let displayedListItem = EditGrocery.DisplayedListItem(name: "")
    let displayedListItems = [sections[0]: [displayedListItem], sections[1]: [displayedListItem]]
    
    // When
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: nil, displayedListItems: displayedListItems, sections: sections)
    sut.displayEditedGrocery(viewModel: viewModel)
    
    // Then
    XCTAssertEqual(sut.tableView.numberOfSections, displayedListItems.count, "The number of tableview sections should equal the number of list categories to display")
  }
  
  func testNumberOfRowsShouldEqaulNumberOfGroceryListCategoriesItemsToDisplay()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let sections = ["section1"]
    let displayedListItem = EditGrocery.DisplayedListItem(name: "")
    let displayedListItems = [sections[0]: [displayedListItem, displayedListItem, displayedListItem]]
    
    // When
    let viewModel = EditGrocery.Edit.ViewModel(groceryName: nil, displayedListItems: displayedListItems, sections: sections)
    sut.displayEditedGrocery(viewModel: viewModel)
    
    // Then
    XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), displayedListItems[sections[0]]!.count, "The number of tableview sections should equal the number of list categories to display")
  }
  
  func testShouldConfigureTableViewCellToDisplayListItem()
  {
    // Given
    let spy = EditGroceryBusinessLogicSpy()
    sut.interactor = spy
    loadView()
    let sections = ["section1"]
    let displayedListItem = EditGrocery.DisplayedListItem(name: "milk")
    let displayedListItems = [sections[0]: [displayedListItem, displayedListItem, displayedListItem]]
    sut.sections = sections
    sut.displayedItems = displayedListItems
    sut.tableView.reloadData()
    
    // When
    let indexPath = IndexPath(row: 0, section: 0)
    let cell = sut.tableView(sut.tableView!, cellForRowAt: indexPath) as! EditCell
    
    // Then
    XCTAssertEqual(cell.tfItem.text, "milk", "A properly configured table view cell should display the list item name")
  }
}
