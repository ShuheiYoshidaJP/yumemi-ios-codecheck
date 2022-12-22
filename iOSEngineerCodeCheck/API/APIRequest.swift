//
//  APIRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol APIRequest {
    associatedtype Response: ResponseType
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: String] { get }
    var url: URL? { get }
}

extension APIRequest {
    var baseURL: String {
        return "https://api.github.com"
    }
}
