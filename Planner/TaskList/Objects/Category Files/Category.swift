//
//  Category.swift
//  Planner
//
//  Created by Joshua Cortright on 3/7/26.
//

import Observation
import SwiftUI

@Observable class Category: Hashable, Identifiable
{
    let id = UUID()
    var name: String
    var color: Color
    var tasks: [Task]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool
    {
        return lhs.id == rhs.id
    }
    
    func appendTask(task: Task)
    {
        tasks.append(task)
    }
    
    init(name: String, color: Color, tasks: [Task])
    {
        self.name = name
        self.color = color
        self.tasks = tasks
    }
}
