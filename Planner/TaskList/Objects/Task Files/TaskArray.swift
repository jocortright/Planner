//
//  TaskArray.swift
//  Planner
//
//  Created by Joshua Cortright on 3/23/26.
//

import Observation
import SwiftUI

@Observable class TaskArray
{
    var displayedTasks: [Task] = []
    
    func addTask(task: Task)
    {
        displayedTasks.append(task)
    }
}
