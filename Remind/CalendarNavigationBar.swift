//
//  CalendarNavigationBar.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CalendarNavigationBar: BaseView {
    fileprivate let titleViewDateFormatter = "yyyy年MM月"
    
    typealias Block = () -> Void
    public var titleDidSelectedCallback: Block?
    public var todayDidSelectedCallback: Block?
    
    public private(set) var currentTitleDate: Date?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTitle(_ date: Date) {
        let today = Date()
        currentTitleDate = date
        titleLabel.text = date.toString(titleViewDateFormatter)
        todayButton.isHidden = today.year == date.year && today.month == date.month
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let tap = UITapGestureRecognizer()
        tap
            .rx
            .event
            .subscribe(onNext: { [weak self] _ in
                self?.titleDidSelectedCallback?()
            })
            .addDisposableTo(self.disposeBag)
        
        let label = UILabel()
        label.font = UIFont.H4
        label.textAlignment = .center
        label.textColor = UIColor.hightGray
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
        }
        return label
    }()
    
    private(set) lazy var todayButton: UIButton = {
        let btn = UIButton()
        btn.isHidden = true
        btn.setTitle("今天", for: .normal)
        btn.titleLabel?.font = UIFont.text
        btn.setTitleColor(UIColor.hightGray, for: .normal)
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.height.trailing.bottom.equalToSuperview()
            make.width.equalTo(44)
        }
        btn
            .rx
            .controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] _ in
                self?.todayDidSelectedCallback?()
            })
            .addDisposableTo(self.disposeBag)
        return btn
    }()
}
