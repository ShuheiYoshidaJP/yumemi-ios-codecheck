//
//  RxSessionMock.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
@testable import iOSEngineerCodeCheck

final class RxSessionMock: RxSessionBase {
    private let statusCode: Int

    init(statusCode: Int) {
        self.statusCode = statusCode
    }

    func response(request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)> {
        let url = request.url!
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        return Observable.just((response, Data.init()))
    }
}
