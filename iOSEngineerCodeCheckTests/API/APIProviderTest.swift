//
//  APIProviderTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import XCTest
import RxSwift
@testable import iOSEngineerCodeCheck

class APIProviderTest: XCTestCase {

    private let requestType: GithubAPIRequest.RequestType = .searchRepository("Swift", 30)
    private var request: GithubAPIRequest!
    private let disposeBag = DisposeBag()

    override func setUp() {
        request = GithubAPIRequest(requestType: requestType)
    }

    func testBadRequest() {

        let session = RxSessionMock(statusCode: 400)
        let dependency = APIProvider.Dependency(session: session, decoder: .init())
        let provider = APIProvider(dependency: dependency)
        let result = provider.exec(request: request)

        var thrownError: Error?

        result.subscribe(onError: {error in
            thrownError = error
        }).disposed(by: disposeBag)

        XCTAssertTrue(thrownError is SearchError)
    }

}
