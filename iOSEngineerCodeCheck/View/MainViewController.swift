//
//  MainViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel(dependency: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
        setUpSearchBar()
    }
}

extension MainViewController {

    private func setUpBinding() {
        let input = MainViewModel.Input(searchText: searchBar.rx.text.orEmpty.asObservable())
        let output = viewModel.transform(input: input)

        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")

        output.repos
            .bind(to: tableView.rx.items(cellIdentifier: "RepoTableViewCell", cellType: RepoTableViewCell.self)) {(_, item, cell) in
                cell.item = item
        }
        .disposed(by: disposeBag)

        tableView.rx.modelSelected(Repo.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.name)")
        }).disposed(by: disposeBag)
    }

}

extension MainViewController {

    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }

    private func setUpSearchBar() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doneButtonTapped))
        view.addGestureRecognizer(tap)
    }
}
