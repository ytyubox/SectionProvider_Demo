//
//  TitleCell.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
protocol TitleCellDisplayable { var title:String {get}}
class TitleCell: UITableViewCell {
  override func prepareForReuse() {
    label.text = cellInfo.title
  }
  var cellInfo:TitleCellDisplayable!
  private let label: UILabel
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    label = UILabel()
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    label.translatesAutoresizingMaskIntoConstraints = false
    addSubview(label)
    topAnchor.constraint(equalTo: label.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


