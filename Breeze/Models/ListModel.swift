//
//  ListModel.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import Foundation

struct ListCategory: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var jobs: [Job]
    var iconName: String
    
    init(id: UUID = UUID(), name: String, jobs: [Job], iconName: String = "folder") {
        self.id = id
        self.name = name
        self.jobs = jobs
        self.iconName = iconName
    }
}

struct Job : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var status : JobStatus
    var createdAt : Date
    var subTasks : [SubTask]
}

struct SubTask: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var status: JobStatus
    var createdAt : Date
}

enum JobStatus: Hashable, Identifiable{
    case todo
    case inProgress
    case done
    case list(ListCategory)
    var id: String {
        switch self{
        case .todo:
            "todo"
        case .inProgress:
            "in progress"
        case .done:
            "done"
        case .list(let listCat):
            listCat.id.uuidString
        }
    }
    
    static var allCases: [JobStatus]{
        [.inProgress,.todo,.done]
    }
    
}

struct previewExamples{
    static func examples() -> [ListCategory] {
        [
            ListCategory(name: "General Tasks", jobs: [
                Job(name: "Take out the bins", status: .inProgress, createdAt: Date.now, subTasks: [
                    SubTask(name: "Stand up", status: .todo, createdAt: Date.now),
                    SubTask(name: "Walk downstairs", status: .todo, createdAt: Date.now),
                    SubTask(name: "Pick up the bin", status: .todo, createdAt: Date.now),
                    SubTask(name: "Take it out", status: .todo, createdAt: Date.now)
                ]),
                Job(name: "Tidy my room", status: .todo, createdAt: Date.now, subTasks: [
                    SubTask(name: "Pick up all laundry", status: .todo, createdAt: Date.now),
                    SubTask(name: "Put all rubbish in a bin bag", status: .todo, createdAt: Date.now),
                    SubTask(name: "Change my bedding", status: .todo, createdAt: Date.now),
                ]),
                Job(name: "Clean the kitched", status: .todo, createdAt: Date.now, subTasks: [
                    SubTask(name: "Go downstairs", status: .todo, createdAt: Date.now),
                    SubTask(name: "Put all dirty items in the dishwasher", status: .todo, createdAt: Date.now),
                    SubTask(name: "Hand wash the pans", status: .todo, createdAt: Date.now),
                    SubTask(name: "Wipe down the counters", status: .todo, createdAt: Date.now)
                ])
            ]
            ),
            
            ListCategory(name: "Bluefin automation tasks", jobs: [
                Job(name: "Refactor the website so that james and erin are super happy", status: .inProgress, createdAt: Date.now, subTasks: [
                    SubTask(name: "Go through all the items in the codebase", status: .todo, createdAt: Date.now),
                    SubTask(name: "Ensure each file is more or less single purpose", status: .todo, createdAt: Date.now),
                    SubTask(name: "Cmd I to make sure the indents are right", status: .todo, createdAt: Date.now),
                ]),
                Job(name: "Finish designs for james and erin", status: .todo, createdAt: Date.now, subTasks: [
                    SubTask(name: "Design the news reel", status: .todo, createdAt: Date.now),
                    SubTask(name: "Group everything together in figma", status: .todo, createdAt: Date.now),
                    SubTask(name: "Rename everything in the figma file", status: .todo, createdAt: Date.now),
                ]),
                Job(name: "Land an IOS job", status: .todo, createdAt: Date.now, subTasks: [
                    SubTask(name: "Apply to 7 jobs", status: .todo, createdAt: Date.now),
                    SubTask(name: "Connect with 15 recruiters in next two weeks", status: .todo, createdAt: Date.now),
                    SubTask(name: "Brush up on test driven develpoment", status: .todo, createdAt: Date.now),
                    SubTask(name: "Finsih building breeze", status: .todo, createdAt: Date.now)
                ])
            ]
            )
        ]
    }
}
