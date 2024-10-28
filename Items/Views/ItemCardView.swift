//
//  ItemCardView.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import WidgetKit

struct ItemCardView: View {
    @Environment(\.modelContext) private var context
    var item: Item
    var body: some View {
        
        HStack(spacing: 12) {
            Text("\(String(item.title.prefix(1)))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
                .background(.gray.gradient, in: .circle)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(item.title)
                    .foregroundStyle(Color.primary)
                
                if !item.remark.isEmpty {
                    Text(item.remark)
                        .font(.caption)
                        .foregroundStyle(Color.primary.secondary)
                } else {
                    Text("*No Description*")
                }
                
                Text(format(date: item.dateAdded, format: "dd MMM yyyy"))
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
                //                    if showsCategory {
                //                        Text(transaction.category)
                //                            .font(.caption2)
                //                            .padding(.horizontal, 8)
                //                            .padding(.vertical, 2)
                //                            .foregroundStyle(.white)
                //                            .background(transaction.category == Category.income.rawValue ? Color.green.gradient : Color.red.gradient, in: .capsule)
            })
            .lineLimit(1)
            .hSpacing(.leading)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.background, in: .rect(cornerRadius: 10))
        }
    }
}
