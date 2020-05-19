//
//  SubTitleCell.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

struct SubTitleCellDisplayaable {
  var title: String
  var subtitle:String
}

class SubtitleCell: UITableViewCell, ClassIDProvider, HeightProvider {
  static func height() -> CGFloat {
    100
  }
  
  
  var cellInfo:SubTitleCellDisplayaable! {
    didSet {
      label.text = cellInfo.title
      subtitleLabel.text = cellInfo.subtitle
    }
  }
  private let label: UILabel
  private let subtitleLabel: UILabel
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    label = UILabel()
    subtitleLabel = UILabel()
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    label.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(label)
    addSubview(subtitleLabel)
    // label
    label.heightAnchor.constraint(equalToConstant: 50).isActive  = true
    topAnchor.constraint(equalTo: label.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
    // subtitleLabel
    subtitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    subtitleLabel.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

