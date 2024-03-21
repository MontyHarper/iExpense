//
//  AddView.swift
//  iExpense
//
//  Created by Monty Harper on 8/23/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
                Button("Done") {
                    dismiss()
                }
            }
            
            .navigationTitle("Add Expense")
            .onDisappear {
                
                guard !name.isEmpty, !type.isEmpty, !amount.isZero else { return }
                let item = ExpenseItem(name: name, type: type, amount: amount)
                modelContext.insert(item)
            }
            
//            .toolbar {
//                Button("Save") {
//                    let item = ExpenseItem(name: name, type: type, amount: amount)
//                    expenses.items.append(item)
//                    dismiss()
//                }
//
//            }
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
