//
//  Owner.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

public struct Owner: Codable {
    /// 画像URL
    public let avatarUrl: String

    /// ログイン
    public let login: String

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login
    }
}
