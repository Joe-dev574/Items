//
//  AddItemView.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    //   MARK: Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var remark: String = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 7){
                    Text("Item Title")
                        .font(.caption)
                        .fontDesign(.serif)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                        .padding(.leading, 20)
                    TextField("Item Title...", text:$title)
                        .padding()
                        .font(.headline)
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                        .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.45), radius: 3)), in: .rect(cornerRadius: 7))
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    CustomTextEditSection("Brief Description of Item...", value: $remark)
                        .padding(.horizontal, 10)
                        .lineLimit(3)
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                        .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.55), radius: 4)), in: .rect(cornerRadius: 10))
                    
                    /// Giving Some Space for tapping
                        .padding(.horizontal)
                    
                    
                }.padding(.horizontal,3)
                
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading, content: {
                            Button {
                                HapticManager.notification(type: .success)
                                dismiss()
                            } label: {
                                Text("Cancel")
                                    .fontWeight(.bold)
                            }
                            .buttonStyle(.automatic)
                        })
                        ToolbarItem(placement: .principal, content: {
                            LogoView()
                        })
                        //MARK:  SAVE BUTTON
                        ToolbarItem(placement:.topBarTrailing){
                            Button {
                                let newItem = Item(title: title, remark: remark, timestamp: Date.now)
                                context.insert(newItem)
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
                        }
                    }
            }
        }
    }
}


#Preview {
    AddItemView()
}
//MARK:  CUSTOM SECTIONS

@ViewBuilder
func CustomTextEditSection(_ title: String, value: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 5, content: {
        Text(title)
            .fontDesign(.serif)
            .font(.caption)
            .foregroundStyle(.blue)
            .fontWeight(.bold)
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
