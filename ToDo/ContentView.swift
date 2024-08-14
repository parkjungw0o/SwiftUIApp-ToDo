//
//  ContentView.swift
//  ToDo
//
//  Created by 박정우 on 8/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   @Environment(\.modelContext) private var modelContext // 생성과 삭제 modelContext
   @Query var todoList: [Todo] = [
    Todo(title:"새로운 투두")]
    
    func addTodo() {
        withAnimation{
            let newtodo = Todo(title: "새로운 투두")
            //todoList.append(newtodo)
            modelContext.insert(newtodo)
        }
    }
//        .onDelete(perform: { indexSet in
//            for index in indexSet {
//                todoList.remove(at: index)
//            }
//        })
    func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
               // todoList.remove(at: index)
                let todo = todoList[index]
                modelContext.delete(todo)
            }
        }
    }
        
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(todoList) { todo in
                    HStack{
                        //삼항 연산자를 이용하여 간단히 정리
                        Image(systemName: todo.isCompleted == true ? "circle.fill" : "circle")
                            .foregroundColor(.pink)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                        }
//                        if todo.isCompleted == true {
//                            //투두가 완료 되었을때
//                            Image(systemName: "circle.fill")
//                                .foregroundColor(.pink)
//                                .onTapGesture {
//                                    todo.isCompleted.toggle()
//                            }
//                        } else {
//                            //투두가 완료되지 않았을때
//                            Image(systemName: "circle")
//                                .foregroundColor(.pink)
//                                .onTapGesture {
//                                    todo.isCompleted.toggle()
//                            }
//                        }

                        NavigationLink {
                            TodoDetailView(todo: todo)
                             
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted,color: .gray)
                                .foregroundStyle(todo.isCompleted == true ? Color.gray : Color.primary)
                            // primary: 다크모드 색상
                            // isCompleted == true: gray
                            // isCompleted == false: black
                        }
                    } //Hstack
                    .listRowSeparator(.hidden) //행 마다 줘야하기 떄문에 forEach
                } //forEach
                .onDelete(perform: deleteTodo)
            }//List
            Divider()
            .listStyle(.plain)
            .navigationTitle("Todo 🏓")
            .toolbar {
                ToolbarItem{
                    EditButton()
                }
                ToolbarItem {
//                    Button(action: {
//                        addTodo()
//                        
//                    }, label: {
//                        Image(systemName: "plus")
//                    })
                    Button(action: addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        } // NavigationStack
    }
}

#Preview {
    ContentView()
}
