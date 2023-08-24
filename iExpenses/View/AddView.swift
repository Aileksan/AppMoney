//
//  AddView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expensess: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var date = Date()
    
    @State private var category = "Доходы"
    @State private var amount: Double = 0
    @State private var current = "USD"
    @State private var descripption = ""
    
    let types = ["Доходы","Расходы"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Что сделал?", text: $descripption)
                
                Picker("Категория", selection: $category){
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: current))
                
                    .keyboardType(.decimalPad)
                DatePicker("Дата", selection: $date, displayedComponents: [.date])
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpensesItem(date: date, category: category, amount: amount, description: descripption)
                    expensess.eItems.append(item)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expensess: Expenses())
    }
}
