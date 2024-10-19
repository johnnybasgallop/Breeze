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
            List(selection: $selection){
                ForEach(ListCategories){category in
                    HStack{
                        Label(category.name, systemImage: category.iconName)
                        Spacer()
                        
                        Button(action: {
                            print("clicked")
                        }, label: {
                            Image(systemName: "ellipsis")
                        }).buttonStyle(NoBackgroundButtonStyle())
                    }
                    .tag(JobStatus.list(category))
                }.onMove { from, to in
                    ListCategories.move(fromOffsets: from, toOffset: to)
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200, idealWidth: 225, maxWidth: 300)
    }
}

#Preview {
    Sidebar(ListCategories: .constant(previewExamples.examples()),selection: .constant(.todo))
}
