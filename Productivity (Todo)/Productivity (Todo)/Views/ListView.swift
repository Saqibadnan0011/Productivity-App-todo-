//
//  ListView.swift
//  Productivity (Todo)
//
//  Created by apple on 16/07/2023.
//

import SwiftUI

struct ListView: View {
    
    //@State var isLoggedIn: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes =  [.foregroundColor: UIColor.init(Color(red: 0.2, green: 0.2, blue: 0.2))]
    }

    var body: some View {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemView()
                } else {
                    List  {
                        ForEach(listViewModel.items){ item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
                //.navigationTitle("Your Task List")
                //.foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink("Add",
                              destination: Addview())
                )
            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
                .navigationTitle("Your Task List")
        }
        .environmentObject(ListViewModel())
    }
}
