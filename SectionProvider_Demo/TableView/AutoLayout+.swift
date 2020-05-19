//
//  AutoLayout+.swift
//  SectionProvider_Demo
//
//  Created by 游宗諭 on 2020/5/19.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

func viewFullyEmbed(_ v1:UIView, _ v2: UIView) {
  v2.translatesAutoresizingMaskIntoConstraints = false
  v1.addSubview(v2)
  v1.topAnchor.constraint(equalTo: v2.topAnchor).isActive = true
  v1.leadingAnchor.constraint(equalTo: v2.leadingAnchor).isActive = true
  v1.trailingAnchor.constraint(equalTo: v2.trailingAnchor).isActive = true
  v1.bottomAnchor.constraint(equalTo: v2.bottomAnchor).isActive = true
}
