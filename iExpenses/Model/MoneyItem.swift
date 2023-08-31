//
//  MoneyItem.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import Foundation


struct ExpensesItem: Identifiable, Codable, Equatable{
    var id = UUID()
    
    let date: Date
    let category: String
    let amount: Double
    let description: String
    
}

struct IncomeItem: Identifiable, Codable, Equatable{
    var id = UUID()
    
    let date: Date
    let category: String
    let amount: Double
    let description: String
    
}
