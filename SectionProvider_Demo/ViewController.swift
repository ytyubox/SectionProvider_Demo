//
//  ViewController.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  let tableView:UITableView = TableView(frame: .zero, style: .plain)
  let models: [AnyUITableViewSectionProvider] = [
    NumbersModel()
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.anchorToSuperSiew(superview: view)
    tableView.delegate = self
    tableView.dataSource = self
    models.forEach{
      $0.registTo(tableView)
    }
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    models.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    models[section].numberOfRowsIn(tableView)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    models[indexPath.section].cellForRowAt(tableView, indexPath: indexPath)
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    models[indexPath.section].heightForRowAt(tableView, At: indexPath.row)
  }
}


