//
//  TaskView.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI

struct TaskView: View {
    let Jobs : [Job]
    var body: some View {
        List{
            ForEach(JobStatus.allCases){status in
                Section(header:Text(String(status.id).capitalized).font(.title3)){
                    switch status{
                    case .inProgress:
                        inProgressWidget(Jobs: Jobs)
                        
                    case .todo:
                        ForEach(Jobs.filter {$0.status == status}){job in
                            Text(job.name).font(.title3).underline()
                            ForEach(job.subTasks){ subtask in
                                Text(subtask.name)
                            }
                        }
                        
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
            
        }.listStyle(SidebarListStyle())
    }
}

#Preview {
    TaskView(Jobs: previewExamples.examples()[1].jobs)
}
