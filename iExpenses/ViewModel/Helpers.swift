//
//  Helpers.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import Foundation
import Combine


class Expenses: ObservableObject{
  
    @Published var eItems = [ExpensesItem](){
        didSet{
            if let encode = try? JSONEncoder().encode(eItems){
                UserDefaults.standard.set(encode, forKey: "eItems")
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
                eItems = decoderItem
                return
            }
        }

        
        eItems = []
    }
}

