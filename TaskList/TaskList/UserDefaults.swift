//
//  UserDefaults.swift
//  TaskList
//
//  Created by Попов Виталий on 01.03.2021.
//

import Foundation

class TaskStore {
    func saveTasks(tasks: [TaskModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    func loadTasks() -> [TaskModel] {
        var tasks = [TaskModel]()
        if let items = UserDefaults.standard.data(forKey: "tasks") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([TaskModel].self, from: items) {
                tasks = decoded
                return tasks
            }
        }
        return []
    }
    
}
