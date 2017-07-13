//
//  CalendarViewController.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FSCalendar
import EventKit

class CalendarViewController: BaseViewController {
    fileprivate let identifier = String(describing: UITableViewCell.self)
    fileprivate var titleView: CalendarNavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private(set) lazy var chineseCalendar: NSCalendar? = {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.chinese)
        return calendar
    }()
    
    private(set) lazy var lunarChars: [String] = {
        return ["初一","初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五",
                "十六","十七","十八","十九","二十","廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"]
    }()
    
    private(set) lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.headerHeight = 0
        calendar.appearance.titleDefaultColor = UIColor.hightGray
        calendar.appearance.titlePlaceholderColor = UIColor.mediumGray
        calendar.appearance.subtitleDefaultColor = UIColor.hightGray
        calendar.appearance.subtitlePlaceholderColor = UIColor.mediumGray
        calendar.appearance.weekdayTextColor = UIColor.hightGray
        calendar.appearance.weekdayFont = UIFont.H6
        return calendar
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        return tableView
    }()
    
    private func setupView() {
        view.addSubview(calendar)
        view.addSubview(tableView)
        
        calendar.snp.makeConstraints { make in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(250)
        }
        tableView.snp.makeConstraints { make in
            make.leading.width.bottom.equalToSuperview()
            make.top.equalTo(calendar.snp.bottom)
        }
    }
}

extension CalendarViewController: FSCalendarDelegate {
    // 点击
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    
    }
    
    // 大小发生变化
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendar.snp.updateConstraints { make in
            make.height.equalTo(bounds.height)
        }
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
        print(bounds)
    }
    
    // 滑动
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        changeNavigation(date: calendar.currentPage)
    }
}

extension CalendarViewController: FSCalendarDataSource {
    // 副标题
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        if let day = self.chineseCalendar?.component(NSCalendar.Unit.day, from: date),
            day >= 0,
            day <= lunarChars.count {
            return lunarChars[day-1]
        }
        return nil
    }
    
}

extension CalendarViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if calendar.scope == .month, offsetY > 0 {
            calendar.setScope(.week, animated: true)
        }
        
        if calendar.scope == .week, offsetY <= 0 {
            calendar.setScope(.month, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

// MARK: - Navigation Bar
extension CalendarViewController {
    
    fileprivate func setupNavigation() {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: 44)
        titleView = CalendarNavigationBar(frame: rect)
        titleView?.setTitle(calendar.currentPage)
        navigationItem.titleView = titleView
        
        titleView?.todayDidSelectedCallback = { [weak self] in
            guard let `self` = self else { return }
            self.calendar.setCurrentPage(Date(), animated: true)
        }
        
        titleView?.titleDidSelectedCallback = {
            print("标题呗点击了")
        }
    }
    
    fileprivate func changeNavigation(date: Date) {
        titleView?.setTitle(date)
    }
}

