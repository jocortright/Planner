//
//  CategoryView.swift
//  Planner
//
//  Created by Joshua Cortright on 3/21/26.
//

import SwiftUI

struct CategoryArrayView: View
{
    var categoryArray: CategoryArray
    @State private var categoryPopover = false
    
    var body: some View
    {
        ScrollView // contains all tasks
        {
            ForEach(categoryArray.categories)
            { cat in
                ZStack
                {
                    RoundedRectangle(cornerRadius: 15).fill(cat.color).opacity(0.25)
                    
                    VStack (alignment: .leading)
                    {
                        Text(cat.name).frame(maxWidth: .infinity).bold()
                        ForEach(cat.tasks)
                        { t in
                            Text("- \(t.name)")
                        }
                    }
                    .padding()
                }
            }
            
            ZStack
            {
                RoundedRectangle(cornerRadius: 15)
                .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                .fill(Color.accentColor).opacity(0.1875)
                .onTapGesture
                {
                    categoryPopover = true
                }
                .popover(isPresented: $categoryPopover, attachmentAnchor: .point(.center))
                {
                    CategoryPopover(categoryArray: categoryArray)
                }
                
                Text("+").foregroundColor(Color.accentColor).bold()
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
