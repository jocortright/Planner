//
//  CategoryArray.swift
//  Planner
//
//  Created by Joshua Cortright on 3/20/26.
//

import Observation
import SwiftUI

@Observable class CategoryArray
{
    var categories: [Category] = [Category(name: "Unassigned", color: Color.gray, tasks: [])]
    
    func addCategory(category: Category)
    {
        categories.append(category)
    }
}
