//
//  AppViewModel.swift
//  MovieHubRx
//
//  Created by Duy Nguyễn on 13/05/2024.
//

import Foundation
import RxCocoa
import RxSwift

struct AppViewModel {
    let useCase: AppUseCaseType
    let navigator: AppNavigatorType
}

extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        input.loadTrigger
            .drive(onNext: self.navigator.toTabBar)
            .disposed(by: disposeBag)
        return Output()
    }
}
