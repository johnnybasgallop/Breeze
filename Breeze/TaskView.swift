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
                Section(status.id){
                    ForEach(Jobs.filter {$0.status == status}){job in
                        Text(job.name).padding().font(.title2)
                        ForEach(job.subTasks){ subtask in
                            Text(subtask.name).padding(.leading, 20)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    TaskView(Jobs: ListCategory.example(generalTitle: "House Chores", fakeJobName: "Take out the bins" ).jobs)
}
