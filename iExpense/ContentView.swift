//
//  ContentView.swift
//  iExpense
//
//  Created by Monty Harper on 8/14/23.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var showingAddExpense = false
    @State private var filterBy: ExpenseType? = nil
    @State private var sortBy: [SortDescriptor<ExpenseItem>] = [SortDescriptor(\.amount), SortDescriptor(\.name)]
    
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("Show Me: ")
                    Button("Business"){
                        filterBy = ExpenseType.Business
                    }
                    .foregroundColor(filterBy == .Business ? .green : .black)
                    Text(" • ")
                    Button("Personal"){
                        filterBy = ExpenseType.Personal
                    }
                    .foregroundColor(filterBy == .Personal ? .green : .black)
                    Text(" • ")
                    Button("All"){
                        filterBy = nil
                    }
                    .foregroundColor(filterBy == nil ? .green : .black)
                }
                .buttonStyle(.plain)
                
                
                Picker("Sort by: ", selection: $sortBy) {
                    Text("Name")
                        .tag(
                            [SortDescriptor(\ExpenseItem.name),
                             SortDescriptor(\ExpenseItem.amount)]
                        )
                    Text("Amount")
                        .tag(
                            [SortDescriptor(\ExpenseItem.amount),
                             SortDescriptor(\ExpenseItem.name)]
                        )
                }
                
                ExpensesListView(sortOrder: sortBy, filterByType: filterBy)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
            
        } // End Navigation View
        
    }
    
    
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
