//
//  SearchError.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

enum SearchError: Error {
    /// サーチバーに入力された文字数が少ない
    case fewCharacters

    /// データの変換に失敗
    case decodeJson

    /// ネットワークエラー
    /// - Parameter ステータスコード
    case network(Int)
}
