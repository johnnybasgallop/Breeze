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
    
    static func example(generalTitle : String, fakeJobName: String) -> ListCategory {
        ListCategory(name: generalTitle, jobs:[Job(name: fakeJobName, status: .todo, createdAt: Date.now, subTasks:[
            SubTask(name: "Stand up", status: .todo, createdAt: Date.now),
            SubTask(name: "Walk outside", status: .inProgress, createdAt: Date.now),
            SubTask(name: "Pick up the bin", status: .done, createdAt: Date.now)
        ]
                                                  )
        ]
                     ,iconName: "folder.badge.person.crop")
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
