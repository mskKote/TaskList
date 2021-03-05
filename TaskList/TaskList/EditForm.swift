//
//  EditForm.swift
//  TaskList
//
//  Created by Попов Виталий on 02.03.2021.
//

import SwiftUI

struct EditForm: View {
    var index: Int
    @ObservedObject var tasks: Tasks
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Title", text: $tasks.tasks[index].title)
                    TextField("Description", text: $tasks.tasks[index].description)
                        .frame(width: .infinity, height: 300, alignment: .center)
                    DatePicker(selection: $tasks.tasks[index].deadline, label: {
                        Text("Deadline")
                    })
                    .accentColor(.black)
                    Picker(selection: $tasks.tasks[index].status, label: Text("Status"), content: {
                        Text("New").tag("New")
                        Text("In progress").tag("InProgress")
                        Text("Done").tag("Done")
                    })
                }
            }
        }
    }
}

struct EditForm_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
