//
//  UniversityCell.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

class UniversityCell: UITableViewCell {

// MARK: - Outlets
  @IBOutlet weak var universityNameLabel: UILabel!
  @IBOutlet weak var universityStateLabel: UILabel!
    
  // MARK: - Life Cycle
  override func awakeFromNib() {
      super.awakeFromNib()
  }

  func configure(_ viewItem: UniversityViewItem) {
    universityNameLabel.text = viewItem.name
    universityStateLabel.text = viewItem.stateProvince
  }
}
