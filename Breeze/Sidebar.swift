//
//  Sidebar.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI

struct Sidebar: View {
    var ListCategories : [ListCategory]
    @Binding var selection : JobStatus
    var body: some View {
        VStack{
            List(selection: $selection){
                ForEach(ListCategories){category in
                    Label(category.name, systemImage: category.iconName)
                        .tag(JobStatus.list(category))
                }
            }
        }
    }
}

#Preview {
    Sidebar(ListCategories: [ListCategory.example(generalTitle: "General Chores", fakeJobName: "Take out the bins"), ListCategory.example(generalTitle: "Homework", fakeJobName: "Begin studying for AP final")], selection: .constant(.todo))
}
