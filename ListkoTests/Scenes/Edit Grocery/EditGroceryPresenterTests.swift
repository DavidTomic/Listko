//
//  EditGroceryPresenterTests.swift
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

class EditGroceryPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: EditGroceryPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupEditGroceryPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupEditGroceryPresenter()
  {
    sut = EditGroceryPresenter()
  }
  
  // MARK: Test doubles
  
  class EditGroceryDisplayLogicSpy: EditGroceryDisplayLogic
  {
    
    // MARK: Method call expectations
    
    var displayEditedGroceryCalled = false
    
    // MARK: Argument expectations
    
    var editGroceryViewModel: EditGrocery.Edit.ViewModel!
    
    // MARK: Spied methods
    
    func displayEditedGrocery(viewModel: EditGrocery.Edit.ViewModel)
    {
      displayEditedGroceryCalled = true
      editGroceryViewModel = viewModel
    }
  }
  
  // MARK: Test Edit Grocery
  
  func testPresentEditedGrocery_ShouldAskViewController_ToDisplayGroceryList()
  {
    // Given
    let spy = EditGroceryDisplayLogicSpy()
    sut.viewController = spy
    let groceryList = GroceryList()
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)

    // Then
    XCTAssertTrue(spy.displayEditedGroceryCalled, "presentGroceryListToEdit() should ask the view controller to display the result")
  }
  
  func testPresentEditedGrocery_ShouldFormatGroceryName()
  {
    // Given
    let editGroceryDisplayLogicSpy = EditGroceryDisplayLogicSpy()
    sut.viewController = editGroceryDisplayLogicSpy
    let groceryList = GroceryList()
    groceryList.title = "Shopping list"
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)
    
    // Then
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.groceryName, "Shopping list", "presenter should format Grocery name")
  }
  
  func testPresentEditedGrocery_ShouldFormatGroceryNameToNil()
  {
    // Given
    let editGroceryDisplayLogicSpy = EditGroceryDisplayLogicSpy()
    sut.viewController = editGroceryDisplayLogicSpy
    let groceryList = GroceryList()
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)
    
    // Then
    XCTAssertNil(editGroceryDisplayLogicSpy.editGroceryViewModel.groceryName, "presenter should format unset Grocery name to nil")
  }
  
  
  func testPresentEditedGrocery_ShouldFormat_GroceryDefaultListCategory()
  {
    // Given
    let editGroceryDisplayLogicSpy = EditGroceryDisplayLogicSpy()
    sut.viewController = editGroceryDisplayLogicSpy
    let groceryList = GroceryList()
    let listCategory = ListCategory()
    listCategory.name = "section"
    groceryList.listCategories.append(listCategory)
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)
    
    // Then
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.sections[0], "section", "presenter should format Grocery Default ListCategory")
  }
  
  func testPresentEditedGrocery_DefaultListCategory_ShouldContainOneListItem()
  {
    // Given
    let editGroceryDisplayLogicSpy = EditGroceryDisplayLogicSpy()
    sut.viewController = editGroceryDisplayLogicSpy
    
    let groceryList = GroceryList()
    let listCategory = ListCategory()
    groceryList.listCategories.append(listCategory)
    let listItem = ListItem()
    listCategory.listItems.append(listItem)
    
    let defaultSection = listCategory.name
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)
    
    // Then
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.displayedListItems[defaultSection]!.count, 1, "default ListCategory should contain one ListItem")
  }
  
  func testPresentEditedGroceryList_ShouldProperlyFormat_ListCategories_AndListItem()
  {
    // Given
    let editGroceryDisplayLogicSpy = EditGroceryDisplayLogicSpy()
    sut.viewController = editGroceryDisplayLogicSpy
    
    let listItem = ListItem()
    listItem.name = "firstItem"
    let listItemSecond = ListItem()
    listItemSecond.name = "secondItem"
    
    let listCategory = ListCategory()
    listCategory.name = "section1"
    listCategory.listItems.append(listItem)
    listCategory.listItems.append(listItemSecond)
    
    let listCategorySecond = ListCategory()
    listCategorySecond.name = "section2"
    listCategorySecond.listItems.append(listItem)
    listCategorySecond.listItems.append(listItemSecond)
    
    let groceryList = GroceryList()
    groceryList.listCategories.append(listCategory)
    groceryList.listCategories.append(listCategorySecond)
    
    // When
    let response = EditGrocery.Edit.Response(groceryList: groceryList)
    sut.presentGroceryListToEdit(response: response)
    
    // Then
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.sections.count, groceryList.listCategories.count,
                   "Presenting the groceryList to edit should have equal number of list categories in model")
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.sections[0], groceryList.listCategories.first!.name,
                   "Presenting the groceryList to edit should format ListCategory")
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.sections[1], groceryList.listCategories.last!.name,
                   "Presenting the groceryList to edit should format ListCategory")
    
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.displayedListItems[listCategory.name]!.first!.name,
                   groceryList.listCategories.first!.listItems.first!.name,
                   "Presenting the groceryList to edit should format ListItem")
    XCTAssertEqual(editGroceryDisplayLogicSpy.editGroceryViewModel.displayedListItems[listCategorySecond.name]!.last!.name,
                   groceryList.listCategories.first!.listItems.last!.name,
                   "Presenting the groceryList to edit should format ListItem")
  }
  
}