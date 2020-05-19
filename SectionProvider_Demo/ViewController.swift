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
  let model: [UITableViewSectionProvider] = [
    
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.anchorToSuperSiew(superview: view)
    tableView.delegate = self
    tableView.dataSource = self
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    model.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    model[section].numberOfRowsIn(tableView)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    model[indexPath.section].cellForRowAt(tableView, index: indexPath.row)
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    model[indexPath.section].heightForRowAt(tableView, At: indexPath.row)
  }
}


