//
//  TaskForm.swift
//  TaskList
//
//  Created by Попов Виталий on 01.03.2021.
//

import SwiftUI

struct TaskForm: View {
    
    @Binding var isModal: Bool
    var tasks: Tasks
    
    @State var taskValue = TaskModel(
        title: "",
        description: "",
        deadline: Date(),
        status: "New")

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Title", text: $taskValue.title)
                    TextField("Description", text: $taskValue.description)
                        .frame(width: .infinity, height: 300, alignment: .center)
                    DatePicker(selection: $taskValue.deadline, label: {
                        Text("Deadline")
                    })
                    .accentColor(.black)
                    Button(action: {
                        // устанавливаем конкретный объект
                        tasks.tasks.append(taskValue)
                        tasks.tasks = tasks.tasks;
                        isModal = false
                    }, label: {
                        Text("Save")
                    })
                    .frame(width: 310, height: 40, alignment: .center)
                    .accentColor(.green)
                    Button(action: {
                        isModal = false
                    }, label: {
                        Text("Cancel")
                    })
                    .frame(width: 310, height: 40, alignment: .center)
                    .accentColor(.red)
                }
            }
        }
    }
}

struct TaskForm_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
