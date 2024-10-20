//
//  TaskView.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI

struct TaskView: View {
    let Jobs : [Job]
    @State private var isPresented: Bool = false
    var body: some View {
        List{
            NewJobInput(isPresented: $isPresented)
            ForEach(JobStatus.allCases){status in
                Section(header:Text(String(status.id).capitalized).font(.title3)){
                    switch status{
                    case .inProgress:
                        inProgressWidget(Jobs: Jobs)
                        
                    case .todo:
                        VStack{
                            ForEach(Jobs.filter {$0.status == status}){job in
                                TodoComponent(name: job.name)
                            }
                        }.padding(.top)
                        
                    case .done:
                        ForEach(Jobs.filter {$0.status == status}){job in
                            Text(job.name).font(.title3).underline()
                            ForEach(job.subTasks){ subtask in
                                Text(subtask.name)
                            }
                        }
                        
                    default:
                        Text("nothing to show")
                    }
                }
            }
            
        }
        .listStyle(SidebarListStyle())
        .sheet(isPresented: $isPresented){
           AddJobSheet(isPresented: $isPresented)
                .frame(minWidth: 400, idealWidth: 500, maxWidth: 600, minHeight: 180, idealHeight: 275, maxHeight: 300)
        }
    }
}

#Preview {
    TaskView(Jobs: previewExamples.examples()[1].jobs)
}
