//
//  ItemsView.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//
import SwiftUI
import SwiftData

struct ItemsListView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showDeleteConfirmation: Bool = false
    @State private var showAddItem: Bool = false
    
    
    var body: some View {
        NavigationSplitView {
            ItemList()
        
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        .toolbar {
            ///profile pic button
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    HapticManager.notification(type: .success)
                } label: {
                    ZStack{
                        Circle()
                            .fill(.blue)
                            .frame(width: 45 , height: 45)
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .clipShape(.circle)
                            .frame(width: 40 , height: 40 )
                            .tint(.white)
                    }
                }
            }
#if os(iOS)
            
#endif
            ToolbarItem(placement: .principal) {
                LogoView()
            }
            ///add objective
            ToolbarItem {
                Button{
                    showAddItem.toggle()
                    HapticManager.notification(type: .success)
                } label: {
                    Image(systemName: "plus")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(.blue.gradient.shadow(.drop(color: .black.opacity(0.55), radius: 2, x:2, y: 2)), in: .circle)
                }
            }
        }.padding(.horizontal)
            .sheet(isPresented: $showAddItem, content: {
                AddItemView()
                    .presentationDetents([.medium])
                    .interactiveDismissDisabled()
                    .presentationCornerRadius(30)
            })
    } detail: {
        Text("Select an item")
       
    }
}
}
#Preview {
    ItemsListView()
        .modelContainer(for: Item.self, inMemory: true)
}
