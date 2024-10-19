//
//  inProgressWidget.swift
//  Breeze
//
//  Created by johnny basgallop on 19/10/2024.
//

import SwiftUI

struct inProgressWidget: View {
    let Jobs : [Job]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: 350)
//                .frame(height: 300)
            
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(Jobs.filter {$0.status == .inProgress}){job in
                    InProgressTitleAndMore(name: job.name)
                    HStack{
                        Spacer()
                        AddTaskButton()
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    ScrollView(showsIndicators: false){
                        ForEach(job.subTasks){ subtask in
                            SubTaskComponenet(name: subtask.name)
                            SubTaskComponenet(name: subtask.name)
                        }
                    }
                }
            }
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: 350)
//            .frame(height: 300)
        }.padding(.vertical)
    }
}

struct SubTaskComponenet: View {
    let name: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal)
            
            HStack{
                Text(name).foregroundStyle(.black)
                Spacer()
                Circle().fill(.clear).stroke(.black).frame(height: 20)
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
        }
    }
}

struct InProgressTitleAndMore: View {
    var name : String
    var body: some View {
        HStack(alignment: .top){
            Text(name).font(.system(size: 20, weight: .regular))
                .padding(.trailing, 45)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            Spacer()
            Button(action: {
                print("more pressed")
            }, label: {
                Image(systemName: "ellipsis")
            })
            .padding(.top, 10)
            .buttonStyle(NoBackgroundButtonStyle())
        }
        .padding(.top, 5)
        .padding(.horizontal)
    }
}


struct AddTaskButton: View {
    var body: some View {
        Button(action: {
            print("add task pressed")
        }, label: {
            HStack(alignment: .center, spacing: 5){
                Image(systemName: "plus")
                Text("add task").font(.system(size: 15, weight: .regular))
            }
        })
        .buttonStyle(NoBackgroundButtonStyle())
    }
}

#Preview {
    inProgressWidget(Jobs: previewExamples.examples()[1].jobs)
}
