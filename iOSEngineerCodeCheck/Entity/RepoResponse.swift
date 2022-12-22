//
//  RepoResponse.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

public struct RepoResponse: ResponseType {
    public let items: [Repo]
}

extension RepoResponse {
    enum CodingKeys: String, CodingKey {
        case items
    }
}

extension RepoResponse {
    static var empty: RepoResponse {
        RepoResponse(items: [])
    }
}
