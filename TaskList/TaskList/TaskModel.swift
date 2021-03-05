//
//  TaskModel.swift
//  TaskList
//
//  Created by Попов Виталий on 01.03.2021.
//

import Foundation

struct TaskModel: Identifiable, Encodable, Decodable {
    var id = UUID();
    var title: String;
    var description: String;
    var deadline: Date;
    var status: String;
}
