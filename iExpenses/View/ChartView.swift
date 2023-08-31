//
//  ChartView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 26.08.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    
//    @StateObject private var  expenses = Expenses()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            //            Text ("My Money")
            //
            //            Text ("Total: \(expenses.expenseItems.reduce(0, { $0 + $1.amount }))")
            //                .fontWeight(.semibold)
            //                .font(.footnote)
            //                .foregroundColor(.secondary)
            //                .padding(.bottom, 12)
            //
            //            Chart{
            //
            //                ForEach(expenses.expenseItems){ shart in
            //                    BarMark(x: .value("Date", shart.date, unit: .day),
            //                            y: .value("amount", shart.amount))
            //                    .foregroundStyle(Color.green.gradient)
            //                    .cornerRadius(10)
            //                }
            //                RuleMark(y: .value("Gran", 20))
            //                    .foregroundStyle(Color.red)
            //                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
            //                    .annotation(alignment: .leading ) {
            //                        Text("Gran")
            //                            .font(.caption)
            //                            .foregroundColor(.red)
            //                    }
            //                }
            //
            //            .frame(height: 180)
            //            .chartXAxis{
            //                AxisMarks(values: expenses.expenseItems.map{ $0.date }){date in
            //                    AxisGridLine()
            //                    AxisTick()
            //                    AxisValueLabel(format: .dateTime.day())}
            //            }
            ////            .chartPlotStyle { plotContent in
            ////                plotContent
            ////                    .background(.black.gradient.opacity(0.3))
            ////            }
            //        }
            //        .padding()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
