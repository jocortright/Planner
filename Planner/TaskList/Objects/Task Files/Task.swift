//
//  Task.swift
//  Planner
//
//  Created by Joshua Cortright on 3/7/26.
//

import Observation
import SwiftUI

@Observable class Task: Identifiable, Hashable
{
    let id = UUID()
    var name: String
    var completed: Bool
    var parentCategory: Category
    var prerequisites: [Task]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool
    {
        return lhs.id == rhs.id
    }
    
    init(name: String, prerequisites: [Task], category: Category)
    {
        self.name = name
        self.prerequisites = prerequisites
        self.completed = false
        self.parentCategory = category
    }
}
