//
//  CategoryTableViewCell.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UITableViewCellReusableView {
  
  @IBOutlet private weak var label: UILabel!
  
  private var item: Genre? {
    didSet {
      self.label?.text = item?.name
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
    self.backgroundColor = UIColor.clear
  }
  
  func setup(item: Genre, color: UIColor, select: Bool = false) {
    self.item = item
    setup(selected: select)
    self.label.textColor = UIColor.white
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    setup(selected: selected)
  }
  
  private func setup(selected: Bool) {
    guard let text = self.item?.name else { return }
    self.label.text = selected ? "\(text) ✓" : "\(text)"
    self.label.font = selected ? UIFont.boldSystemFont(ofSize: 17.0) : UIFont.systemFont(ofSize: 15.0)
  }
}
