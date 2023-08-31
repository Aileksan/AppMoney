//
//  ContentView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI
import Charts

struct MainView: View {
    
    @StateObject private var  expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 4){
                Text ("My Money")
                
                Text ("Total: \(expenses.expenseItems.reduce(0, { $0 + $1.amount }))")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                
                Chart{
                    
                    ForEach(expenses.expenseItems){ shart in
                        BarMark(x: .value("Date", shart.date, unit: .day),
                                y: .value("amount", shart.amount))
                        .foregroundStyle(Color.green.gradient)
                        .cornerRadius(10)
                    }
                    RuleMark(y: .value("Gran", 20))
                        .foregroundStyle(Color.red)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading ) {
                            Text("Gran")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    
                    ForEach(expenses.incomeItems){ shart in
                        BarMark(x: .value("Date", shart.date, unit: .day),
                                y: .value("amount", shart.amount))
                        .foregroundStyle(Color.green.gradient)
                        .cornerRadius(10)
                    }
                    RuleMark(y: .value("Gran", 20))
                        .foregroundStyle(Color.red)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading ) {
                            Text("Gran")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                }
                
                .frame(height: 180)
                .chartXAxis{
                    AxisMarks(values: expenses.expenseItems.map{ $0.date }){date in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel(format: .dateTime.month())}
                }
                .chartXAxis{
                    AxisMarks(values: expenses.incomeItems.map{ $0.date }){date in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel(format: .dateTime.day())}
                }
                //            .chartPlotStyle { plotContent in
                //                plotContent
                //                    .background(.black.gradient.opacity(0.3))
                //            }
            }
            .padding()
            
            List{
                ForEach((expenses.expenseItems), id: \.id){ item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.description)
                                Text(item.category)
                            }
                            .padding()
                            Spacer()
                            VStack{
                                Text("\(item.amount.formatted(.currency(code: "USD")))")
                                    .font(.system(size: 20).bold())
                                Text("\(item.date.formatted(date: .numeric, time: .omitted))")
                            }
                        }
                    
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                }
                .onDelete { idx in
                    expenses.expenseItems.remove(atOffsets: idx)
                }
                ForEach((expenses.incomeItems), id: \.id){ item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.description)
                                Text(item.category)
                            }
                            .padding()
                            Spacer()
                            VStack{
                                Text("\(item.amount.formatted(.currency(code: "USD")))")
                                    .font(.system(size: 20).bold())
                                Text("\(item.date.formatted(date: .numeric, time: .omitted))")
                            }
                    }
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                }
                .onDelete { idx in
                    expenses.incomeItems.remove(atOffsets: idx)
                }
            }
            .listStyle(.plain)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expensess: expenses)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
