//
//  ListView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI

struct ListView: View {
//    @StateObject private var  expenses = Expenses()
//    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationStack{
//            List{
//                ForEach((expenses.expenseItems), id: \.id){ item in
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text(item.description)
//                            Text(item.category)
//                        }
//                        .padding()
//                        Spacer()
//                        VStack{
//                            Text("\(item.amount.formatted(.currency(code: "USD")))")
//                                .font(.system(size: 20).bold())
//                            Text("\(item.date.formatted(date: .numeric, time: .omitted))")
//                        }
//                    }
//                    .background(Color.white.opacity(0.7))
//                    .cornerRadius(10)
//                }
//                .onDelete { idx in
//                    expenses.expenseItems.remove(atOffsets: idx)
//                }
//            }
//            .listStyle(.plain)
//        }
//        .navigationTitle("iExpense")
//        .toolbar {
//            Button {
//                showingAddExpense = true
//            } label: {
//                Image(systemName: "plus")
//            }
//        }
//        .sheet(isPresented: $showingAddExpense) {
//            AddView(expensess: expenses)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
