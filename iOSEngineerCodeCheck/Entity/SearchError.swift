//
//  SearchError.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

enum SearchError: Error {
    case fewCharacters
    case decodeJson
    case network(Int)
}
