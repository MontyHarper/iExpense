//
//  ExpensesListView.swift
//  iExpense
//
//  Created by Monty Harper on 3/21/24.
//

import SwiftData
import SwiftUI

struct ExpensesListView: View {
    @Query var expenses: [ExpenseItem]
    @Environment(\.modelContext) var modelContext
    
    
    init(sortOrder: [SortDescriptor<ExpenseItem>], filterByType: ExpenseType?) {
        let type = filterByType?.rawValue ?? ""
        if type != "" {
            print("filtering by: ", type)
            _expenses = Query(
                filter: #Predicate<ExpenseItem> { item in
                    item.type == type
                },
                sort: sortOrder)
        } else {
            _expenses = Query(sort: sortOrder)
        }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(expenses.filter {$0.type == "Business"}) { item in
                    ExpenseRow(item: item)
                }.onDelete(perform: removeItems)
            } header: {
                Text("Business Expenses")
            }
            
            Section {
                
                ForEach(expenses.filter {$0.type == "Personal"}) { item in
                    ExpenseRow(item: item)
                }.onDelete(perform: removeItems)
            } header: {
                Text("Personal Expenses")
            }
        }
    }
    
    func removeItems(at offsets:IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
    
}
