//
//  Date+Extension.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
    
}

extension Date {
    
    private var currentLocaleCalendar: Calendar {
        var calendar = Calendar.current
        calendar.locale = Locale.current
        return calendar
    }
    
    var era: Int {
        return currentLocaleCalendar.component(Calendar.Component.era, from: self)
    }
    
    var year: Int {
        return currentLocaleCalendar.component(Calendar.Component.year, from: self)
    }
    
    var month: Int {
        return currentLocaleCalendar.component(Calendar.Component.month, from: self)
    }
    
    var day: Int {
        return currentLocaleCalendar.component(Calendar.Component.day, from: self)
    }
    
    var hour: Int {
        return currentLocaleCalendar.component(Calendar.Component.hour, from: self)
    }
    
    var minute: Int {
        return currentLocaleCalendar.component(Calendar.Component.minute, from: self)
    }
    
    var second: Int {
        return currentLocaleCalendar.component(Calendar.Component.second, from: self)
    }
    
    var weekday: Int {
        return currentLocaleCalendar.component(Calendar.Component.weekday, from: self)
    }
    
    var weekdayOrdinal: Int {
        return currentLocaleCalendar.component(Calendar.Component.weekdayOrdinal, from: self)
    }
    
    var quarter: Int {
        return currentLocaleCalendar.component(Calendar.Component.quarter, from: self)
    }
    
    var weekOfMonth: Int {
        return currentLocaleCalendar.component(Calendar.Component.weekOfMonth, from: self)
    }
    
    var weekOfYear: Int {
        return currentLocaleCalendar.component(Calendar.Component.weekOfMonth, from: self)
    }
    
    var yearForWeekOfYear: Int {
        return currentLocaleCalendar.component(Calendar.Component.yearForWeekOfYear, from: self)
    }
    
    var nanosecond: Int {
        return currentLocaleCalendar.component(Calendar.Component.nanosecond, from: self)
    }
    
    var calendar: Int {
        return currentLocaleCalendar.component(Calendar.Component.calendar, from: self)
    }
    
    var timeZone: Int {
        return currentLocaleCalendar.component(Calendar.Component.timeZone, from: self)
    }
}
