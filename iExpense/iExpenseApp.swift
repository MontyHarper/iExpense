//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Monty Harper on 8/14/23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
