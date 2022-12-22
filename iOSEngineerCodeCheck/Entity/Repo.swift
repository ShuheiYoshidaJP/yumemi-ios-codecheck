//
//  Repo.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

public struct Repo {
    /// リポジトリのID
    public let id: Int

    /// リポジトリの名前
    public let name: String

    /// リポジトリのフルネーム
    public let fullName: String

    /// リポジトリの所有者
    public let owner: Owner

    /// 言語
    public let language: String?

    /// 監視人数
    public let watchersCount: Int

    /// フォーク数
    public let forksCount: Int

    /// issueの数
    public let openIssuesCount: Int

    /// 詳細
    public let description: String?

}

extension Repo: Equatable {
    public static func == (lhs: Repo, rhs: Repo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Repo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case language
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case description
    }
}
