//
//  RepoTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!

    var item: Repo! {
        didSet {
            nameLabel.text = item.name
            fullNameLabel.text = item.fullName
        }
    }
}
