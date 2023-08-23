//
//  MoneyItem.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import Foundation


struct ExpensesItem: Codable, Equatable{
    
    let date: Date
    let category: String
    let amount: Double
    let description: String
    
}

struct ProfitItem: Codable, Equatable{
    
    let date: Date
    let category: String
    let amount: Double
    let description: String
}
