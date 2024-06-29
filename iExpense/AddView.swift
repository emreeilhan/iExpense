//
//  AddView.swift
//  iExpense
//
//  Created by Emre Ilhan on 29.06.2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal","Business"]
    
    
    var expenses:Expenses
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            
            .navigationTitle("Add Expense")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newItem = ExpenseItems(name: name, type: type, amount: amount)
                        expenses.items.append(newItem)
                        dismiss()
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
