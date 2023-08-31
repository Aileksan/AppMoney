//
//  AddView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI

struct AddView: View {
    enum MoneyType: String {
            case expense = "Расходы"
            case income = "Доходы"
        }
    
    @ObservedObject var expensess: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var date = Date()
    @State private var mType: MoneyType = .expense

    @State private var amount: Double = 0
    @State private var descripption = ""
    
    var isSaveButtonDisabled: Bool {
            descripption.isEmpty || amount == nil
        }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Что сделал?", text: $descripption)
                Picker("Категория", selection: $mType){
                    Text("Расходы").tag(MoneyType.expense)
                    Text("Доходы").tag(MoneyType.income)
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                DatePicker("Дата", selection: $date, displayedComponents: [.date])
            }
            .navigationTitle("Add new Money")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        switch  mType {
                        case .expense:
                            expensess.expenseItems.append(ExpensesItem(date: date, category: mType.rawValue, amount: amount, description: descripption))
                        case .income:
                            expensess.incomeItems.append(IncomeItem(date: date, category: mType.rawValue, amount: amount, description: descripption))
                        }
                        dismiss()
                    }
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
