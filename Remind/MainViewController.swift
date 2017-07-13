//
//  MainViewController.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit

class MainViewController: BaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupView() {
        viewControllers = [
            noteNVC,
            calendarNVC
        ]
    }
    
    private(set) lazy var noteNVC: BaseNavigationController = {
        let vc = NoteListViewController()
        let nvc = BaseNavigationController(rootViewController: vc)
        nvc.tabBarItem = UITabBarItem(title: "Note", image: nil, selectedImage: nil)
        return nvc
    }()
    
    private(set) lazy var calendarNVC: BaseNavigationController = {
        let vc = CalendarViewController()
        let nvc = BaseNavigationController(rootViewController: vc)
        nvc.tabBarItem = UITabBarItem(title: "Calendar", image: nil, selectedImage: nil)
        return nvc
    }()
}
