//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Monty Harper on 8/29/23.
//

import Foundation
import SwiftUI

struct ExpenseRow: View {
    
    var item:ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(item.amount < 10.0 ? .green : item.amount < 100 ? .orange : .red)
        }
    }
}
