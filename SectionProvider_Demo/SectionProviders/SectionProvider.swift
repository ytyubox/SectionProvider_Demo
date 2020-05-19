//
//  SectionProvider.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

protocol SectionProvider {
}

protocol AnyUITableViewSectionProvider:SectionProvider {
  func registTo(_ tableView: UITableView)
  func numberOfRowsIn(_ tableView: UITableView) -> Int
  func cellForRowAt(_ tableView: UITableView,  indexPath: IndexPath) -> UITableViewCell
  func heightForRowAt(_ tableView: UITableView, At index: Int) -> CGFloat
}

protocol UITableViewSectionProvider: AnyUITableViewSectionProvider {
  associatedtype Item
  associatedtype Cell: UITableViewCell & ClassIDProvider & HeightProvider
  var items: [Item] {get set}
}
extension UITableViewSectionProvider {
  func getCell(_ tableView: UITableView, indexPath: IndexPath) -> Cell {
    tableView.dequeueReusableCell(withIdentifier: Cell.id(), for: indexPath) as! Cell
  }
  func numberOfRowsIn(_ tableView: UITableView) -> Int {
    items.count
  }
  func registTo(_ tableView: UITableView) {
    tableView.register(Cell.self, forCellReuseIdentifier: Cell.id())
  }
  func heightForRowAt(_ tableView: UITableView, At index: Int) -> CGFloat {
    return Cell.height()
  }
}
protocol HeightProvider:AnyObject {
  static func height() -> CGFloat
}

protocol ClassIDProvider:AnyObject {
  static func id() -> String
}

func _classIDProvider<T:AnyObject>(_ t:T.Type) -> String {
  let fullName = "\(t)"
  return fullName.components(separatedBy: ".").last!
  
}

extension ClassIDProvider {
  static func id() -> String {
    _classIDProvider(Self.self)
  }
}
