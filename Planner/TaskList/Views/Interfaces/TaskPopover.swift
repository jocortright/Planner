//
//  Popover.swift
//  Planner
//
//  Created by Joshua Cortright on 3/20/26.
//

import SwiftUI

struct TaskPopover: View
{
    @Environment(\.dismiss) private var dismiss
    
    @State private var nameError = false
    
    @State private var taskName: String = ""
    
    var categoryArray: CategoryArray
    var taskArray: TaskArray
    
    @State private var selectedCategory: Category?
    
    var body: some View
    {
        NavigationStack
        {
            Text("Create New Task").frame(maxWidth:.infinity, alignment: .leading).padding(.leading).bold()
                
            HStack
            {
                Text("Task Name:")
                    
                TextField("", text: $taskName)
            }
            .padding(.horizontal)
            Divider().padding(.horizontal)
                
            HStack
            {
                Text("Category:").frame(maxWidth:.infinity, alignment: .leading).padding(.leading)
                    
                NavigationStack
                {
                    Picker("Category", selection: $selectedCategory)
                    {
                        ForEach(categoryArray.categories)
                        { category in
                            Text(category.name).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .onAppear
            {
                if selectedCategory == nil
                {
                    selectedCategory = categoryArray.categories.first
                }
            }
            
            
            Divider().padding(.horizontal)
                
            Text("Prerequisite Tasks:").frame(maxWidth:.infinity, alignment: .leading).padding(.leading)
                
                
            HStack
            {
                Button("**Cancel**")
                {
                    dismiss()
                }
                    
                Spacer()
                    
                Button("**Create**")
                {
                    if (taskName == "")
                    {
                        nameError = true
                    } else
                    {
                        let task = Task(name: taskName, prerequisites: [], category: selectedCategory ?? categoryArray.categories.first!)
                        
                        taskArray.addTask(task: task)
                        
                        selectedCategory?.tasks.append(task)
                        
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
