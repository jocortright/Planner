//
//  CategoryEditor.swift
//  Planner
//
//  Created by Joshua Cortright on 3/26/26.
//

import SwiftUI

struct CategoryEditor: View
{
    @Environment(\.dismiss) private var dismiss
    @State private var nameError = false
    
    var categoryArray: CategoryArray
    var category: Category
    
    @State private var categoryName: String = ""
    @State private var selectedColor: Color = Color.black
    
    var body: some View
    {
        NavigationStack
        {
            Text("Edit Category")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading)
                .bold()
            
            HStack
            {
                Text("Category Name:")
                TextField("", text: $categoryName)
            }
            .padding(.horizontal)
            Divider().padding(.horizontal)
            
            HStack
            {
                ColorPicker("Color:", selection: $selectedColor)
            }
            .padding(.horizontal)
            
            
            HStack
            {
                Button("**Cancel**")
                {
                    dismiss()
                }
                
                Spacer()
                
                Button("**Update**")
                {
                    if (categoryName == "")
                    {
                        nameError = true
                    } else
                    {
                        category.name = categoryName
                        category.color = selectedColor
                        
                        dismiss()
                    }
                }
                .popover(isPresented: $nameError, attachmentAnchor: .point(.center))
                {
                    NoNameError()
                }
            }
            .padding()
        }
        .frame(width: 300)
        .padding()
        .presentationCompactAdaptation(.popover)
    }
}
