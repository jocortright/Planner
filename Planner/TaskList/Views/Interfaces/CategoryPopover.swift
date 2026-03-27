//
//  CategoryPopover.swift
//  Planner
//
//  Created by Joshua Cortright on 3/21/26.
//

import SwiftUI

struct CategoryPopover: View
{
    @Environment(\.dismiss) private var dismiss
    @State private var nameError = false
    
    @State private var categoryName: String = ""
    @State private var selectedColor = Color.black
    
    var categoryArray: CategoryArray
    
    var body: some View
    {
        NavigationStack
        {
            Text("Create New Category")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading)
                .bold()
            
            HStack
            {
                Text("Category Name:")
                TextField("", text: $categoryName)
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            
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
                
                Button("**Create**")
                {
                    if (categoryName == "")
                    {
                        nameError = true
                    } else
                    {
                        let cat = Category(name: categoryName, color: selectedColor, tasks: [])
                        categoryArray.addCategory(category: cat)
                        
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
