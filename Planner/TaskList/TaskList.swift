//
//  TaskList.swift
//  Planner
//
//  Created by Joshua Cortright on 10/3/25.
//

import SwiftUI

struct TaskList: View
{
    @State private var categoryArray = CategoryArray()
    @State private var displayedTasks = TaskArray()
    
    var body: some View
    {
        VStack (alignment: .leading)
        {
            TaskArrayView(taskArray: displayedTasks, categoryArray: categoryArray)
            
            CategoryArrayView(categoryArray: categoryArray)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TaskList()
}
