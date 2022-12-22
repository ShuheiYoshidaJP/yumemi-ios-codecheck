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
    
    enum RequestType { case searchRepository(String, Int) }
    
    var requestType: RequestType
    
    var path: String {
        switch requestType {
        case .searchRepository:
            return "/search/repositories"
        }
    }
    
    var parameters: [String : String] {
        switch requestType {
        case .searchRepository(let searchText, let page):
            return ["q": searchText, "page": String(page)]
        }
    }
    
    var url: URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        return components?.url
    }
}
