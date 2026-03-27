//
//  NoNameError.swift
//  Planner
//
//  Created by Joshua Cortright on 3/21/26.
//

import SwiftUI

struct NoNameError: View
{
    var body: some View
    {
        Text("Please enter a name.")
            .frame(width: 175)
            .padding()
            .presentationCompactAdaptation(.popover)
    }
}

#Preview
{
    NoNameError()
}
