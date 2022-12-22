//
//  GithubAPIRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct GithubAPIRequest: APIRequest {
    typealias Response = RepoResponse

    enum RequestType {
        /// リポジトリの検索
        /// - Parameter String: 検索ワード
        /// - Parameter Int: 1リクエストあたりのリポジトリ数
        case searchingRepo(String, Int)
    }

    var requestType: RequestType

    var path: String {
        switch requestType {
        case .searchingRepo:
            return "/search/repositories"
        }
    }

    var parameters: [String: String] {
        switch requestType {
        case .searchingRepo(let searchText, let page):
            return ["q": searchText, "page": String(page)]
        }
    }

    /// リクエストURL
    /// - Returns: ベースURL, パス, パラメータを含めたURLを返す
    var url: URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        return components?.url
    }
}
