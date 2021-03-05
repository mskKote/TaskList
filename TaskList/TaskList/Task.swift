//
//  Task.swift
//  TaskList
//
//  Created by Попов Виталий on 01.03.2021.
//

import SwiftUI

struct Task: View {
    @Binding var taskValue: TaskModel;
    let colors = [
        "Done" : Color.green,
        "InProgress" : Color.orange,
        "New" : Color.purple
    ]
    let minWidth: [String : CGFloat] = [
        "Done" : 30.0,
        "InProgress" : 100.0,
        "New" : 20.0
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(taskValue.title)
                Text(taskValue.status)
                    .padding(4)
                    .background(colors[taskValue.status])
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .lineLimit(1)
                    .frame(minWidth: minWidth[taskValue.status])
                Rectangle()
                    .frame(height: 1.0, alignment: .bottom)
                    .foregroundColor(Color.black)
                Text(taskValue.deadline, style: .date)
            }
            .padding()
        }
    }
}

struct Task_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
