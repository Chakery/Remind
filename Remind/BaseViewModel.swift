//
//  BaseViewModel.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum Datasource<T> {
    case object(T)
    case collection([T])
}

class BaseViewModel {
    let disposeBag = DisposeBag()
    
    deinit {
        print(self)
    }
}
