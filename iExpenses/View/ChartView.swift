//
//  ChartView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 26.08.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @StateObject private var  expenses = Expenses()

    var body: some View {
        Chart{
            RuleMark(y: .value("Gran", 20))
                               .foregroundStyle(Color.red)
                               .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                               .annotation(alignment: .leading ) {
                                   Text("Gran")
                                       .font(.caption)
                                       .foregroundColor(.red)
                               }
            ForEach(expenses.eItems){ shart in
                BarMark(x: .value("Date", shart.date),
                        y: .value("amount", shart.amount))
            }
            .foregroundStyle(Color.green.gradient)
                            .cornerRadius(20)
        }
        .padding(.leading)
                    .padding(.trailing)
                    .frame(height: 180)
                    .chartXAxis(content: {
                        AxisMarks(values: expenses.eItems.map({ $0.date }))
                    })
        //            .chartYScale(domain: 0...5000)
                    .chartPlotStyle { plotContent in
                        plotContent
                            .background(.black.gradient)
                    }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
