//
//  Numbers.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

struct NumberData {
  var value:Int
}

class NumbersModel {
  var numbers = (0...100).map(NumberData.init(value: ))
}

extension NumbersModel: UITableViewSectionProvider {
  
  var items: [NumberData] {
    get {
      numbers
    }
    set {
      numbers = newValue
    }
  }
  
  typealias Item = NumberData
  
  typealias Cell = TitleCell
  
 
  func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id(), for: indexPath) as! Cell
    let item = items[indexPath.row].value
    print(cell.description, item)
    cell.cellInfo = .init(title: item.description)
    return cell
  }
  
  func heightForRowAt(_ tableView: UITableView, At index: Int) -> CGFloat {
    return 50
  }
  
  
}
