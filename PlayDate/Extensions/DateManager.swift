//
//  DateManager.swift
//  PlayDate
//
//  Created by Aadil on 10/05/2023.
//

import Foundation

class DateManager {
    
    static let shared = DateManager()
    
    func getString(from date: Date) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let stringDate = dateFormat.string(from: date)
        return stringDate
    }
    
    func getMonthName(from date: Date) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM, yyyy"
        let stringDate = dateFormat.string(from: date)
        return stringDate
    }
    func getYear(from date: Date) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy"
        let stringDate = dateFormat.string(from: date)
        return stringDate
    }
}
