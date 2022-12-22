//
//  APIProvider.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift

protocol APIProviderBase {
    func exec<T: APIRequest>(request: T) -> Observable<T.Response>
}

class APIProvider: APIProviderBase {
    
    struct Dependency {
        var session: URLSession
        var decoder: JSONDecoder
        
        public static var `default`: Dependency {
            Dependency(
                session: .shared,
                decoder: .init()
            )
        }
    }
    
    private let dependency: Dependency
    
    init(dependency: Dependency = .default) {
        self.dependency = dependency
    }
    
    func exec<T: APIRequest>(request: T) -> Observable<T.Response> {
        let uRequest = Observable.just(request.url)
            .compactMap { $0 }
            .map { URLRequest(url: $0) }
        let response = uRequest.flatMap {
            self.dependency.session.rx.response(request: $0)
        }.map { response, data -> T.Response in
            if 200..<300 ~= response.statusCode {
                do {
                    return try self.dependency.decoder.decode(T.Response.self, from: data)
                } catch {
                    throw SearchError.decodeJson
                }
            } else {
                throw SearchError.network(response.statusCode)
            }
        }
        return response
    }
}
