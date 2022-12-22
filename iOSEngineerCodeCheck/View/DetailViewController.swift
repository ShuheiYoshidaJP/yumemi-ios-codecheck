//
//  DetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    var item: Repo!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(item)
    }
}
