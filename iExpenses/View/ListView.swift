//
//  ListView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var expenses = Expenses()

    var body: some View {
            ScrollView{
                VStack(spacing: 18){
                    ForEach((expenses.eItems), id: \.id){ item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.description)
                                Text(item.category)
                            }
                            .padding()
                            Spacer()
                            VStack{
                                Text("$\(item.amount.formatted())")
                                    .font(.system(size: 20).bold())
                                Text("\(item.date.formatted(date: .numeric, time: .omitted))")
                            }
                            .padding()
                        }
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.leading)
                        .padding(.trailing)
                    }
                }
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
