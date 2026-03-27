//
//  TaskView.swift
//  Planner
//
//  Created by Joshua Cortright on 3/21/26.
//

import SwiftUI

struct TaskArrayView: View
{
    @State private var taskPopover = false
    
    var taskArray: TaskArray
    var categoryArray: CategoryArray

    var body: some View
    {
        VStack (alignment: .leading) // main to-do
        {
            Text("Outstanding Tasks:").bold()
            
            VStack (alignment: .leading)
            {
                ForEach(taskArray.displayedTasks)
                { t in
                    Text("- \(t.name)").foregroundColor(t.parentCategory.color)
                }
            }
        }
        .padding()
        
        HStack
        {
            Text("All Tasks:").bold()
            
            Spacer()
            
            Button("+ Add")
            {
                taskPopover = true
            }
            .popover(isPresented: $taskPopover, attachmentAnchor: .point(.center))
            {
                TaskPopover(categoryArray: categoryArray, taskArray: taskArray)
            }
        }
        .padding()
    }
}
