//
//  BaseView.swift
//  Remind
//
//  Created by Chakery on 2017/7/12.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseView: UIView {
    let disposeBag = DisposeBag()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    deinit {
        print(self)
    }
}
