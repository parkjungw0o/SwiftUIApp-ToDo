//
//  Todo swift.swift
//  ToDo
//
//  Created by 박정우 on 8/5/24.
//

import Foundation
import SwiftData

@Model
//@Observable  SwfitUI가 관리한다
class Todo: Identifiable { //Identifiable: 고유식별자가 있다고 설명
    let id: UUID
    var title: String
    var isCompleted: Bool
    var detail: String
    
    init(title: String){
        self.id = UUID() //고유 식별자
        self.title = title
        self.isCompleted = false
        self.detail = ""
    }
}
