//
//  AutoLayout+.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
extension UIView {
  func anchorToSuperSiew(superview: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    superview.addSubview(self)
    superview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    superview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    superview.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    superview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
}
