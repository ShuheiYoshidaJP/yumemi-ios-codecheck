//
//  RxSession.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift

protocol RxSessionBase {
    func response(request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)>
}

class RxSession: RxSessionBase {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func response(request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)> {
        return Observable.just(request)
            .flatMap {
                self.session.rx.response(request: $0)
            }
    }
}
