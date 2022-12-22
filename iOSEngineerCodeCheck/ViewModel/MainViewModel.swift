//
//  MainViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 吉田周平 on 2022/12/22.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel {
    
    struct Dependency {
        
        var githubAPI: GithubAPIBase
        var scheduler: SchedulerType
        
        public static var `default`: Dependency {
            Dependency(
                githubAPI: GithubAPI(),
                scheduler: MainScheduler.instance
            )
        }
    }
    
    struct Input {
        let searchText: Observable<String>
    }
    
    struct Output {
        let repos: Observable<[Repo]>
    }
    
    private let dependency: Dependency
    
    init(dependency: Dependency = .default) {
        self.dependency = dependency
    }
    
    func tranAPIsform(input: Input) -> Output {
        
        let delayedInputSearchText = input.searchText
            .debounce(.seconds(1), scheduler: dependency.scheduler)
            .distinctUntilChanged()
        
        let validatedSearchText = delayedInputSearchText
            .filter{ $0.count >= 2 }
        
        let repos = validatedSearchText
            .flatMap { searchText in
                self.dependency.githubAPI.fetchRepository(inputText: searchText)
            }
            .catchAndReturn(RepoResponse.empty)
            .map { $0.items }
        
        return Output(repos: repos)
    }
}
