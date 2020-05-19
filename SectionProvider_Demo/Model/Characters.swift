//
//  Characters.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

struct ASCIIData {
  var IntValue:Int
  var char:UnicodeScalar
}

class ASCIIModel {
  var asciis:[ASCIIData] = {
    var output = [ASCIIData]()
    for i in 65 ...  75 {
      output.append(.init(IntValue: i, char: UnicodeScalar(i)!))
    }
    return output
  }()
}

extension ASCIIModel: UITableViewSectionProvider {
  var items: [ASCIIData] {
    get {
      asciis
    }
    set {
      asciis = newValue
    }
  }
  
  typealias Item = ASCIIData
  
  typealias Cell = SubtitleCell
  
  func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell = getCell(tableView, indexPath: indexPath)
    let item = items[indexPath.row]
    cell.cellInfo = .init(title: item.char.description, subtitle: item.IntValue.description)
    return cell
  }
  
}
