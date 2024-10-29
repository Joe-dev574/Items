//
//  ItemList.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import SwiftData

struct ItemList: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Item]
    
    var body: some View {
        
        if items.isEmpty {
            ContentUnavailableView("Capture your first Item.", systemImage: "exclamationmark.triangle.fill")
        } else{
            ScrollView {
                ForEach(items) { item in
                    NavigationLink {
                        EditItemView()
                    } label: {
                        HStack(spacing: 10) {
                            item.icon
                                .font(.title)
                            
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text(item.title)
                                    .fontDesign(.serif)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                                
                                if !item.remark.isEmpty {
                                    Text(item.remark)
                                        .font(.caption)
                                        .fontDesign(.serif)
                                        .foregroundStyle(Color.primary.secondary)
                                } else {
                                    Text("- No Description provided -")
                                }
                                
                                HStack {
                                    Text("Date Created: ")
                                        .fontDesign(.serif)
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    Image(systemName: "calendar.badge.clock")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                    Text(item.dateAdded.formatted(.dateTime))
                                        .font(.footnote)
                                        .fontDesign(.serif)
                                        .foregroundColor(.secondary)
                                }.padding(.top, 5)
                                if let focusTags = item.focusTags{
                                    ViewThatFits {
                                        FocusTagsStackView(focusTags: focusTags)
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            FocusTagsStackView(focusTags: focusTags)
                                        }
                                    }
                                }
                            })
                            .hSpacing(.leading)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(.background, in: .rect(cornerRadius: 10))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity,
                               minHeight: 0, maxHeight: .infinity)
                        .padding(.horizontal,4)
                    }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let item = items[index]
                            context.delete(item)
                        }
                    }
                }
            }
        }
    }


#Preview {
    ContentView()
       
}
