//
//  MainViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import RxSwift

final class MainViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel(dependency: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
        self.tableView.keyboardDismissMode = .onDrag
    }
}

extension MainViewController {

    private func setUpBinding() {
        let input = MainViewModel.Input(
            searchText: searchBar.rx.text.orEmpty.asObservable(),
            itemSelected: tableView.rx.itemSelected.asObservable(),
            modelSelected: tableView.rx.modelSelected(Repo.self).asObservable()
        )
        let output = viewModel.transform(input: input)

        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")

        output.repos
            .bind(to: tableView.rx.items(cellIdentifier: "RepoTableViewCell", cellType: RepoTableViewCell.self)) {(_, item, cell) in
                cell.item = item
        }
        .disposed(by: disposeBag)

        output.itemSelected.bind { indexPath, item in
            self.tableView.deselectRow(at: indexPath, animated: false)
            self.showDetail(item: item)
        }
        .disposed(by: disposeBag)

    }
}

extension MainViewController {
    private func showDetail(item: Repo) {
        let dvc = DetailViewController.initFromNib()
        dvc.item = item
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
