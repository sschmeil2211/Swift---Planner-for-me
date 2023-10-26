//
//  ToDoListItemView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSinceNow: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        item: .init(
            id: "123",
            title: "Get milk",
            dueDate: Date().timeIntervalSinceNow,
            createDate: Date().timeIntervalSinceNow,
            isDone: false
        )
    )
}
