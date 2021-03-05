//
//  ContentView.swift
//  TaskList
//
//  Created by Попов Виталий on 01.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var tasksModel = Tasks()
    @State var isModal = false
    
    var body: some View {
        NavigationView {
            List {
                // 1 task
                ForEach(0..<tasksModel.tasks.count) {
                    index in
                    NavigationLink(
                        destination: EditForm(index: index, tasks: tasksModel),
                        label: {
                            Task(taskValue: $tasksModel.tasks[index])
                        })
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        tasksModel.tasks.remove(at: index)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isModal = true
                    }, label: {
                        HStack(spacing: 5) {
                            Image(systemName: "plus")
                            Text("Add new task")
                        }
                        .foregroundColor(Color(red: 0, green: 0, blue: 57))
                    })
                }
            }
            .sheet(isPresented: $isModal, content: {
                TaskForm(isModal: $isModal, tasks: tasksModel)
            })
            
        }
    }
}

class Tasks: ObservableObject {
    var store = TaskStore()
    @Published var lastTitle = ""
    @Published var tasks: [TaskModel] {
        didSet {
            store.saveTasks(tasks: tasks)
        }
    }

    init() {
        self.tasks = store.loadTasks()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
