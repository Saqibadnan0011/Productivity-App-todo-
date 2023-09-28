//
//  ListRowView.swift
//  Productivity (Todo)
//
//  Created by apple on 17/07/2023.
//

import SwiftUI


struct ListRowView: View {
    
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark"  : "xmark")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item", isCompleted: false)
    static var item2 = ItemModel(title: "second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
