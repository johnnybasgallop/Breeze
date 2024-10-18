//
//  Sidebar.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI

struct Sidebar: View {
    @Binding var ListCategories : [ListCategory]
    @Binding var selection : JobStatus
    var body: some View {
        VStack{
            List(selection: $selection){
                ForEach(ListCategories){category in
                    HStack{
                        Label(category.name, systemImage: category.iconName)
                        Spacer()
                        
                        Button(action: {
                            print("clicked")
                        }, label: {
                            Image(systemName: "ellipsis")
                        })
                    }
                    .tag(JobStatus.list(category))
                }.onMove { from, to in
                    ListCategories.move(fromOffsets: from, toOffset: to)
                }
            }
        }
    }
}

#Preview {
    Sidebar(ListCategories: .constant([ListCategory.example(generalTitle: "General Chores", fakeJobName: "Take out the bins"), ListCategory.example(generalTitle: "Homework", fakeJobName: "Begin studying for AP final")]), selection: .constant(.todo))
}
