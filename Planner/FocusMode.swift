//
//  FocusMode.swift
//  Planner
//
//  Created by Joshua Cortright on 10/14/25.
//

import SwiftUI

struct FocusMode: View
{
    @State private var focus = false
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("Focus Mode")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Toggle("", isOn: $focus)
            }
            Text("* NOTE: You will need the Apple Shortcuts App installed for this feature to work as intended.")
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    FocusMode()
}
