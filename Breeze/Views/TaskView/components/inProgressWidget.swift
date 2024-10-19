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
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: 350)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(Jobs.filter {$0.status == .inProgress}){job in
                    InProgressTitleAndMore(name: job.name)
                    HStack{
                        Spacer()
                        AddTaskButton()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    ScrollView(showsIndicators: false){
                        ForEach(job.subTasks){ subtask in
                            SubTaskComponenet(name: subtask.name)
                        }
                    }.padding(.bottom, 5)
                }
            }
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: 350)
        }.padding(.vertical)
    }
}

struct SubTaskComponenet: View {
    let name: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .padding(.horizontal)
            
            HStack{
                Text(name).foregroundStyle(.black).font(.system(size: 16))
                Spacer()
                Circle().fill(.clear).stroke(.black).frame(height: 20)
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
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
                Image(systemName: "ellipsis").font(.system(size: 20))
            })
            .padding(.top, 10)
            .padding(.bottom)
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
                Text("Add task").font(.system(size: 15, weight: .regular))
            }
        })
//        .padding(.top, 5)
        .buttonStyle(NoBackgroundButtonStyle())
    }
}

#Preview {
    inProgressWidget(Jobs: previewExamples.examples()[1].jobs)
}
