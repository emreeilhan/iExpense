//
//  ContentView.swift
//  iExpense
//
//  Created by Emre Ilhan on 29.06.2024.
//

import SwiftUI



struct ExpenseItems: Codable {
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}

@Observable
class Expenses {
    var items = [ExpenseItems]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems){
                items = decodedItems
                return
            }
            
        }
        items = []
    }
    
    
}

struct ContentView: View {
    @State var expenses = Expenses()
    @State private var isAddViewShowing = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items, id: \.id) { item in
                    HStack{
                        Text(item.name)
                        Text(item.type)
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }.onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add Expense", systemImage: "plus") {
                    isAddViewShowing = true
                }
            }
            
        }
        
        .sheet(isPresented: $isAddViewShowing) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
