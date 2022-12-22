//
//  GithubAPI.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubAPIBase {
    func fetchRepository(inputText: String) -> Observable<RepoResponse>
}

final class GithubAPI: GithubAPIBase {
    
    private var provider: APIProviderBase
    
    init(provider: APIProviderBase = APIProvider()) {
        self.provider = provider
    }
    
    func fetchRepository(inputText: String) -> Observable<RepoResponse> {
        let githubAPIReq = GithubAPIRequest(requestType: .searchRepository(inputText, 30))
        return provider.exec(request: githubAPIReq)
    }
}

