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
  func numberOfRowsIn(_ tableView: UITableView) -> Int
  func cellForRowAt(_ tableView: UITableView,  index: Int) -> UITableViewCell
  func heightForRowAt(_ tableView: UITableView, At index: Int) -> CGFloat
}

protocol UITableViewSectionProvider: AnyUITableViewSectionProvider {
  associatedtype Item
  associatedtype Cell: UITableViewCell
  var items: [Item] {get set}
  
}

protocol ClassIDProvider:AnyObject {
  static func id() -> String
}

func _classIDProvider<T:AnyObject>(_ t:T.Type) -> String {
  let fullName = NSStringFromClass(t)
  
  // this splits by the dot and uses everything after, giving "MyViewController"
  return fullName.components(separatedBy: ".")[1]
  
}

extension ClassIDProvider {
  static func id() -> String {
    _classIDProvider(Self.self)
  }
}
