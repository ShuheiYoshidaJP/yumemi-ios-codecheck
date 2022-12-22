//
//  DetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController {

    var item: Repo!

    @IBOutlet private weak var ownerImage: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var ownerLabel: UILabel!
    @IBOutlet private weak var watcherLabel: UILabel!
    @IBOutlet private weak var forkLabel: UILabel!
    @IBOutlet private weak var issueLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: item.owner.avatarUrl) {
            ownerImage.kf.setImage(with: url)
        }
        fullNameLabel.text = item.name
        fullNameLabel.text = item.fullName
        languageLabel.text = item.language
        ownerLabel.text = item.owner.login
        watcherLabel.text = String(item.watchersCount)+"people"
        forkLabel.text = String(item.forksCount)+"forks"
        issueLabel.text = String(item.openIssuesCount)+"issues"
        descriptionLabel.text = item.description
    }
}
