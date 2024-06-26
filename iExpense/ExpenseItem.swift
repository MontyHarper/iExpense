//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Monty Harper on 8/23/23.
//

import Foundation
import SwiftData

@Model
class ExpenseItem: Identifiable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

enum ExpenseType: String {
    case Business
    case Personal
}
