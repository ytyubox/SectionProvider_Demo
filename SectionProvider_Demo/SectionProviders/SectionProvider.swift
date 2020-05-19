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

protocol UITableViewSectionProvider:SectionProvider {
  func numberOfRowsIn(_ tableView: UITableView) -> Int
  func cellForRowAt(_ tableView: UITableView,  index: Int) -> UITableViewCell
  func heightForRowAt(_ tableView: UITableView, At index: Int) -> CGFloat
}
