//
//  AddItemView.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI

struct AddItemView: View {
    /// Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var remark: String = ""
    @State var dateAdded: Date = .now
    
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 7){
                   
                    CustomSection("Title", "Item Title...", value: $title)
                        .font(.title2)
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                        .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.55), radius: 4)), in: .rect(cornerRadius: 10))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    
                    CustomTextEditSection("Brief Description of Item...", value: $remark)
                        .padding(.horizontal, 10)
                        .lineLimit(3)
                        .font(.title2)
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                        .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.55), radius: 4)), in: .rect(cornerRadius: 10))
                 
                    /// Giving Some Space for tapping
                        .padding(.horizontal)
                    
                    Spacer( )
                }
                .navigationTitle("Add an Item")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button {
                            HapticManager.notification(type: .success)
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        .buttonStyle(.automatic)
                    })
                    ToolbarItem(placement: .principal, content: {
                        LogoView()
                    })
                    ToolbarItem(placement:.topBarTrailing, content: {
                        Button {
                            /// Saving Task
                            //         saveItem()
                            HapticManager.notification(type: .success)
                            dismiss()
                        } label: {
                            Text("Save")
                                .fontDesign(.serif)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(title.isEmpty || remark.isEmpty)
                        .padding(.horizontal, 2)
                    })
                }
            }
            }
        }
        
    }
    //MARK: - Private Methods -


#Preview {
    AddItemView()
}

@ViewBuilder
func CustomSection(_ title: String, _ hint: String, value: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 5, content: {
        Text(title)
            .fontDesign(.serif)
            .font(.title3)
            .foregroundStyle(.gray)
            .padding(.horizontal, 10)
            .frame(height: 25)
        
        TextField(hint, text: value)
            .padding(.horizontal, 10)
            .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.55), radius: 4)), in: .rect(cornerRadius: 10))
            .foregroundStyle(.primary)
            .fontDesign(.serif)
            .frame(height: 25)
    })
}
@ViewBuilder
func CustomTextEditSection(_ title: String, value: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 5, content: {
        Text(title)
            .fontDesign(.serif)
            .font(.title3)
            .foregroundStyle(.gray)
            .padding(.horizontal, 10)
            .frame(height: 35)
        
        TextEditor( text: value)
            .multilineTextAlignment(.leading)
            .lineLimit(5)
            .font(.headline)
            .fontDesign(.serif)
            .foregroundStyle(.black)
            .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.55), radius: 4)), in: .rect(cornerRadius: 10))
            .frame(width: 350, height: 95)
            .padding(.bottom, 10)
        /// Giving Some Space for tapping
    }).padding(.horizontal, 2)
}
