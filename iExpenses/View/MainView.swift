//
//  ContentView.swift
//  iExpenses
//
//  Created by Aleksandr Myasoedov on 24.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var  expenses = Expenses()
    
     var body: some View {
        NavigationStack{
            ChartView()
            
            ListView()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
