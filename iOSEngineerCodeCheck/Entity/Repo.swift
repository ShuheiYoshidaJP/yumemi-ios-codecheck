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
    }
}
