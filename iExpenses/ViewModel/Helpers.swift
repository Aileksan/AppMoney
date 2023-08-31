//
//  Helpers.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import Foundation
import Combine


class Expenses: ObservableObject{
  
    @Published var expenseItems = [ExpensesItem](){
        didSet{
            if let encode = try? JSONEncoder().encode(expenseItems){
                UserDefaults.standard.set(encode, forKey: "expenseItems")
            }
        }
    }
    
    @Published var incomeItems = [IncomeItem](){
        didSet{
            if let encode = try? JSONEncoder().encode(incomeItems){
                UserDefaults.standard.set(encode, forKey: "incomeItems")
            }
        }
    }
    
//    var expenselItem: [ExpensesItem]{
//        get { eItems.filter{$0.category == "Расходы"}}
//        set{  }
//    }
//    var profitItem: [ExpensesItem]{
//        get {eItems.filter{$0.category == "Доходы"}}
//        set{ }
//    }
    init(){
        if let save = UserDefaults.standard.data(forKey: "eItems"){
            if let decoderItem = try? JSONDecoder().decode([ExpensesItem].self, from: save){
                expenseItems = decoderItem
                return
            }
        }
        if let savei = UserDefaults.standard.data(forKey: "incomeItems"){
            if let decoderItem = try? JSONDecoder().decode([IncomeItem].self, from: savei){
                incomeItems = decoderItem
                return
            }
        }
        incomeItems = []
        expenseItems = []
    }
}

